module MusicIR
  
  class Event
    attr_accessor :duration, :analysis
  
    def initialize(duration, analysis={})
      @duration = duration
      @analysis = analysis
    end
 
    def similarity_to(e)
      if e.class == Event
        return (@duration==e.duration) ? 1.00 : 0.00
      end
      raise RuntimeError.new("Comparing Events to #{e.class}'s is not implemented yet.")
    end
 
  end

end
