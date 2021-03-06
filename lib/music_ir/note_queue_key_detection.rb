#!/usr/bin/env ruby

# FIXME: In section 4 of http://www.comp.nus.edu.sg/~mohan/papers/music_struct_det.pdf, the
# authors point out that chords are likelier to change on beats vs. subbeats, and at half-notes
# (if 4/4 time signature) than quarter notes, and at bar lines, vs non-bar-lines.  The chord
# detection below could probably be enhanced by incorporating this knowledge. If beat position
# of a note were known, different probabilities could be swapped in, accordingly. Refer to the
# SELF_TRANSITION_PROB parameter in tools/create_hmm_matrices_for_key_estimation.rb. That is
# the fudge factor I'm using to slow down the rate of chord change. It should be tweaked down
# for beat zero, and tweaked up for subbeats.

# assumes it is included in NoteQueue
module CanDetectKey
  PITCH_CLASS_STRINGS = ["C","C#","D","D#","E","F","F#","G","G#","A","A#","B"]
  CHORD_MODES         = [:major, :minor]
  CHORDS              = PITCH_CLASS_STRINGS.map { |pc_str| CHORD_MODES.map { |ct| MusicIR::Chord.new(MusicIR::PitchClass.from_s(pc_str), ct) } }.flatten
  CHORD_STRINGS       = CHORDS.map{ |chord| chord.to_s }

  @@hmm = nil

  def analyze_harmony!
    return if @have_analyzed_harmony

    max_likelihood = nil
    likeliest_key_pitch_class = nil
    likeliest_chords = nil

    cur_key_pitch_class = MusicIR::PitchClass.from_s("C")
    0.upto(11) do |transpose_steps| 
      pitch_classes = transposed_pitch_classes(transpose_steps)

      pitch_class_strings = pitch_classes.map{ |pc| pc.to_s(use_flats=false) } # convert using sharps, not flats
      pitch_class_indices = pitch_class_strings.map{ |str| PITCH_CLASS_STRINGS.index(str) }

      inferred_chord_strings = hmm.decode(pitch_class_strings)
      inferred_chord_indices = inferred_chord_strings.map{ |chord_str| CHORD_STRINGS.index(chord_str) }
      inferred_chords        = inferred_chord_indices.map{ |chord_idx| CHORDS[chord_idx] }

      likelihood = hmm.likelihood(pitch_class_strings) * 10**(@notes.length)
      chord_prior_probs = inferred_chord_indices.map{ |chord_idx| hmm.pi[chord_idx] }
      likelihood *= chord_prior_probs.inject(:*)

      if (!max_likelihood) || (likelihood > max_likelihood)
        max_likelihood = likelihood
        likeliest_key_pitch_class = cur_key_pitch_class
        likeliest_chords = inferred_chords.map do |chord|
          MusicIR::Chord.new(MusicIR::PitchClass.new((chord.pitch_class.val+transpose_steps)%12), chord.mode)
        end
      end

      cur_key_pitch_class = MusicIR::PitchClass.new((cur_key_pitch_class.val+1)%12)
    end

    tonic_chords = likeliest_chords.select{ |chord| chord.pitch_class.val==likeliest_key_pitch_class.val }
    major_tonic_count = tonic_chords.select{ |chord| chord.mode==:major }.length
    minor_tonic_count = tonic_chords.select{ |chord| chord.mode==:minor }.length
    key_chord_mode = (major_tonic_count >= minor_tonic_count) ? :major : :minor

    @notes.each_with_index do |note, idx|
      note.analysis[:key]   = MusicIR::Chord.new(likeliest_key_pitch_class, key_chord_mode)
      note.analysis[:chord] = likeliest_chords[idx]
    end

    @have_analyzed_harmony = true # so that we don't do it again
  end
   
private

  def hmm
    if !@@hmm
      @@hmm = HMM::Classifier.new
      @@hmm.o_lex = PITCH_CLASS_STRINGS
      @@hmm.q_lex = CHORD_STRINGS
      @@hmm.a     = $key_estimator_hmm_a
      @@hmm.b     = $key_estimator_hmm_b
      @@hmm.pi    = $key_estimator_hmm_pi
    end
    return @@hmm
  end
 
  def transposed_pitch_classes(steps_down)
    @notes.map do |note| 
      MusicIR::PitchClass.new( ( MusicIR::PitchClass.from_pitch(note.pitch).val+12-steps_down) % 12 ) # transpose down by a # of steps
    end
  end
end

