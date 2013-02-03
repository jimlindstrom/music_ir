#!/usr/bin/env ruby

module MusicIR
  
  class PitchClass
    attr_reader :val

    def initialize(new_val)
      raise ArgumentError.new("newval=#{new_val || "nil"}, which is bogus") if !new_val || new_val < 0 || new_val > 11
      @val = new_val
    end
  
    def self.from_pitch(p)
      PitchClass.new((p.val + 3) % 12)
    end

    def to_s(use_flats=true)
      if use_flats
        ["A","Bb","B","C","Db","D","Eb","E","F","Gb","G","Ab"][@val]
      else
        ["A","A#","B","C","C#","D","D#","E","F","F#","G","G#"][@val]
      end
    end

    def self.from_s(str)
      val   = ["A","Bb","B","C","Db","D","Eb","E","F","Gb","G","Ab"].index(str)
      val ||= ["A","A#","B","C","C#","D","D#","E","F","F#","G","G#"].index(str) 
      PitchClass.new(val)
    end

    def self.num_values
      12
    end
  end

end

