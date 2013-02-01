#!/usr/bin/env ruby

module MusicIR
  
  class Note < Event
    attr_accessor :pitch
  
    def initialize(pitch, duration, analysis={})
      super(duration, analysis)
      @pitch = pitch 
    end

    def similarity_to(n) # returns 1 for identical; 0 for totally different
      return nil if !n

      pitch_similarity = 0.00
      sum_of_weights   = 0.00
      if abs_pitch_similarity_to(n)
        pitch_similarity += 0.35*abs_pitch_similarity_to(n) 
        sum_of_weights   += 0.35
      end
      if interval_similarity_to(n)
        pitch_similarity += 0.25*interval_similarity_to(n) 
        sum_of_weights   += 0.25
      end
      if diatonic_pitch_similarity_to(n)
        pitch_similarity += 0.15*diatonic_pitch_similarity_to(n) 
        sum_of_weights   += 0.15
      end
      if chord_similarity_to(n)
        pitch_similarity += 0.15*chord_similarity_to(n) 
        sum_of_weights   += 0.15
      end
      if key_similarity_to(n)
        pitch_similarity += 0.10*key_similarity_to(n) 
        sum_of_weights   += 0.10
      end
      pitch_similarity = pitch_similarity / sum_of_weights

      duration_similarity = 1.00*duration_similarity_to(n)

      note_similarity = 0.60*pitch_similarity + 
                        0.40*duration_similarity
      return note_similarity
    end

  private

    def abs_pitch_similarity_to(n)
      if n.is_a?(MusicIR::Rest)
        return 0.00
      else 
        return @pitch.similarity_to n.pitch
      end
    end

    def interval_similarity_to(n)
      if n.is_a?(MusicIR::Rest)
        return 0.00
      elsif !@analysis[:interval_before] || !n.analysis[:interval_before]
        return nil # neutral unknown
      else
        return @analysis[:interval_before].similarity_to n.analysis[:interval_before] 
      end
    end

    def chord_similarity_to(n) # FIXME: Should this be part of pitch.similarity_to?
      if n.is_a?(MusicIR::Rest)
        return 0.00
      elsif !@analysis[:chord] || !n.analysis[:chord]
        return nil # neutral unknown
      else
        same_mode = (@analysis[:chord].mode == n.analysis[:chord].mode) ? 1.0 : 0.0
        same_pitch_class = (@analysis[:chord].pitch_class.val == n.analysis[:chord].pitch_class.val) ? 1.0 : 0.0
        return (0.7*same_mode) + (0.3*same_pitch_class)
      end
    end

    def key_similarity_to(n) # FIXME: Should this be part of pitch.similarity_to?
      if n.is_a?(MusicIR::Rest)
        return 0.00
      elsif !@analysis[:key] || !n.analysis[:key] || !@analysis[:chord] || !n.analysis[:chord]
        return nil # neutral unknown
      else
        same_mode = (@analysis[:key].mode == n.analysis[:key].mode) ? 1.0 : 0.0
        same_pitch_class = (@analysis[:key].pitch_class.val == n.analysis[:key].pitch_class.val) ? 1.0 : 0.0
        return (0.7*same_mode) + (0.3*same_pitch_class)
      end
    end

    def diatonic_pitch_similarity_to(n) # FIXME: Should this be part of pitch.similarity_to?
      if n.is_a?(MusicIR::Rest)
        return 0.00
      elsif !@analysis[:key] || !n.analysis[:key]
        return nil # neutral unknown
      else
        my_diatonic_pc = (12 + MusicIR::PitchClass.from_pitch( @pitch).val -  @analysis[:key].pitch_class.val) % 12
        other_diatonic_pc = (12 + MusicIR::PitchClass.from_pitch(n.pitch).val - n.analysis[:key].pitch_class.val) % 12
        return (my_diatonic_pc == other_diatonic_pc) ? 1.0 : 0.0
      end
    end

    def duration_similarity_to(n)
      @duration.similarity_to n.duration
    end
  
  end

end
