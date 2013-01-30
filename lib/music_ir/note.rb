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

      if n.is_a?(MusicIR::Rest)
        pitch_similarity = 0.00
      elsif @pitch.val == n.pitch.val 
        pitch_similarity = 1.00
      elsif (@analysis[:interval_before]) && 
            (n.analysis[:interval_before]) && 
            (@analysis[:interval_before].val == n.analysis[:interval_before].val)
        pitch_similarity = 0.90
      else # otherwise, give the best of the interval or abs. pitch similarity
        interval_similarity  = 0.0
        if @analysis[:interval_before] && n.analysis[:interval_before]
          interval_similarity  = @analysis[:interval_before].similarity_to n.analysis[:interval_before] 
        end

        abs_pitch_similarity = @pitch.similarity_to n.pitch
        pitch_similarity = 0.9 * [ interval_similarity, abs_pitch_similarity ].max
      end

      duration_similarity = @duration.similarity_to n.duration

      note_similarity = 0.6*pitch_similarity + 0.4*duration_similarity
      return note_similarity
    end
  
  end

end
