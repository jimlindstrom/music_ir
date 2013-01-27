module MusicIR
  
  class Event
    attr_accessor :duration, :analysis
  
    def initialize(duration, analysis={})
      @duration = duration
      @analysis = analysis
    end
  
  end

end
