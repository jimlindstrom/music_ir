#!/usr/bin/env ruby

module MusicIR
  class Chord
    attr_reader :pitch_class, :mode
  
    MODES = [:major, :minor]
  
    def initialize(pitch_class, mode)
      raise ArgumentError.new("pitch_class must be a PitchClass") if !pitch_class.is_a?(PitchClass)
      raise ArgumentError.new("mode must be one of #{MODES.inspect}") if !MODES.include?(mode)
      @pitch_class = pitch_class
      @mode = mode
    end
  
    def to_s(use_flats=true)
      @pitch_class.to_s(use_flats) + @mode.to_s
    end
  end
end
