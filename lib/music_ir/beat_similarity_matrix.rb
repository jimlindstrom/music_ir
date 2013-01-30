module MusicIR
  class BeatSimilarityMatrix < BeatCrossSimilarityMatrix

    def initialize(beat_array)
      super(beat_array, beat_array)
    end
    
  end
end
