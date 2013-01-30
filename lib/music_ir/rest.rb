#!/usr/bin/env ruby

module MusicIR
  
  class Rest < Event
  
    def initialize(duration)
      super(duration)
    end
  
    def similarity_to(e)
      if e.class == Rest
        return (@duration==e.duration) ? 1.00 : 0.00
      elsif e.class == Note
        return (@duration==e.duration) ? 1.00 : 0.00
      end
      raise RuntimeError.new("Comparing Rests to #{e.class}'s is not implemented yet.")
    end
 
  end

end
