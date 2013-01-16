#!/usr/bin/env ruby

module MusicIR
  
  class Note < Event
    attr_accessor :pitch
  
    def initialize(pitch, duration)
      super(duration)
      @pitch = pitch 
    end
  
  end

end
