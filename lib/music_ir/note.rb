#!/usr/bin/env ruby

module MusicIR
  
  class Note < Event
    attr_accessor :pitch
  
    def initialize(pitch, duration, analysis={})
      super(duration, analysis)
      @pitch = pitch 
    end
  
  end

end
