#!/usr/bin/env ruby

module MusicIR
  
  class NoteQueue
    attr_accessor :tempo

    include CanDetectMeter
    include CanDetectPhrases
    include CanDetectKey

    def initialize(note_arr)
      @notes = note_arr

      # these pre-processing steps are so cheap that we should just do them now,
      # vs using some more-complicated lazy-evaluation scheme.
      tag_with_notes_left!
      create_intervals!
    end

    def self.from_event_queue(evq)
      iois = evq.get_interonset_intervals + [ evq.get_last_duration ]
      ioi_array = MusicIR::IOIArray.new(iois.dup)
      q_ret = ioi_array.quantize!
  
      notes = []

      iois.zip(evq.get_durations)
          .zip(evq.get_pitches)
          .map{ |x| x.flatten }.each do |ioi, duration, pitch|

        note_dur = (duration         / q_ret[:q]).round
        rest_dur = ((ioi - duration) / q_ret[:q]).round

        raise RuntimeError.new("bogus ioi: #{note_dur}") if (note_dur <= 0) || (note_dur >= Duration.num_values)
        raise RuntimeError.new("bogus pitch: #{pitch}")  if (pitch     < 0) || (pitch    >= Pitch.num_values   )
        notes << Note.new(Pitch.new(pitch), Duration.new(note_dur))

        if rest_dur > 0
          raise RuntimeError.new("bogus ioi: #{rest_dur}") if (rest_dur >= Duration.num_values)
          notes << Rest.new(Duration.new(rest_dur))
        end
      end
      
      nq = NoteQueue.new(notes)
      nq.tempo = q_ret[:q]
      nq
    end
  
    def to_event_queue
      raise ArgumentError.new("tempo must be set") if @tempo.nil? 

      duration_to_timestamp = 60.0 / @tempo * 200.0
  
      eq = MusicIR::EventQueue.new
      timestamp = 0
      @notes.each do |note|
        case note
          when MusicIR::Note
            eq.enqueue MusicIR::NoteOnEvent.new({
                         :pitch     => note.pitch.val,
                         :velocity  => 100,
                         :timestamp => timestamp })
      
            timestamp += note.duration.val * duration_to_timestamp
            eq.enqueue MusicIR::NoteOffEvent.new({
                         :pitch     => note.pitch.val,
                         :velocity  => 100,
                         :timestamp => timestamp })
          when MusicIR::Rest
            timestamp += note.duration.val * duration_to_timestamp
          else
            raise RuntimeError.new("unexpected class: #{note.class}")
        end
  
      end 
  
      return eq
    end

    def to_beat_array
      return @to_beat_array if @to_beat_array  # memoized
      @to_beat_array = []
      prev = nil
      @notes.each do |note|
        b = MusicIR::Beat.new
        b.prev_note = prev
        b.cur_note = note
        @to_beat_array.push b
  
        (note.duration.val-1).times do
          @to_beat_array.push nil
        end
  
        prev = note
      end
      return @to_beat_array
    end

    def to_phenomenal_accent_array
      return @to_phenomenal_array if @to_phenomenal_array  # memoized
      @to_phenomenal_array = []
      @notes.each do |note|
        if note.is_a?(Note)
          @to_phenomenal_array << 1.0
          @to_phenomenal_array += [0.0]*(note.duration.val-1)
        else # if note.is_a?(Rest)
          @to_phenomenal_array += [0.0]*(note.duration.val)
        end
      end
      return @to_phenomenal_array
    end

  private
  
    def tag_with_notes_left! # FIXME: this should be moved into the composer tool. No one else cares.
      @notes.each_with_index do |item, idx|
        item.analysis[:notes_left] = @notes.length - 1 - idx
      end
    end

    def create_intervals!
      prev = nil
      @notes.select{ |x| x.is_a?(Note) }.each do |cur| # skip Rest's
        if !prev.nil?
          i = MusicIR::Interval.calculate(prev.pitch, cur.pitch)
          prev.analysis[:interval_after] = i
          cur.analysis[:interval_before] = i

          di = MusicIR::DistanceInterval.new(prev, cur) # FIXME: I don't think we're using these any more...
          prev.analysis[:distance_interval_after] = di
          cur.analysis[:distance_interval_before] = di
        end
        prev = cur
      end
    end


  end

end

