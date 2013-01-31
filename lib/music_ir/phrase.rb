module MusicIR
  class Phrase
    attr_reader :start_idx, :end_idx

    def initialize(note_queue, start_idx, end_idx)
      raise ArgumentError.new("note_queue cannot be nil") if note_queue.nil?
      raise ArgumentError.new("start_idx must be >= 0") if start_idx < 0
      raise ArgumentError.new("end_idx must be >= start_idx") if start_idx > end_idx
      raise ArgumentError.new("end_idx must be < length") if end_idx >= note_queue.length

      @note_queue = note_queue
      @start_idx  = start_idx
      @end_idx    = end_idx
    end

    def notes
      @note_queue[@start_idx..@end_idx]
    end

    def length
      @end_idx - @start_idx + 1
    end

    def duration
      notes.map{ |note| note.duration.val }.inject(:+)
    end

    DIST_WEIGHT = 3.0      # increasing this favors phrases that contain low-distance intervals
    SIM_A = 1.0            # increasing this favors phrases that are longer
    SIM_B = 2.0            # increasing this favors phrases that are similar to a high number of phrases
    SIM_C = 3.0            # ?
    DUR_DEV_WEIGHT = 250.0 # increases this favors phrases that are closer to the mean duration

    def score(phrase_list)
      total  = duration_penalty
      total -= DIST_WEIGHT*total_distance
      total += similarity_to_other_phrases(phrase_list)
      total -= DUR_DEV_WEIGHT*phrase_list.phrase_duration_penalty_for(self)

      return total
    end

    def split_at_a_big_interval # FIXME: make it return two new ones.
      # choose a spot to split it
      indices = @start_idx..(@end_idx-1)

      x = Markov::RandomVariable.new(Markov::LiteralAlphabet.new((0..(@note_queue.length-1)).to_a))
      indices.zip(@note_queue[indices]).each do |y|
        x.observe!(outcome=y[0], num_observations=1.0+((y[1].analysis[:distance_interval_after].distance || 0.0)*2))
      end
      idx = x.sample

      # generate the new phrase
      new_phrase = Phrase.new(@note_queue, idx+1, @end_idx)
      @end_idx = idx
      return new_phrase
    end

  private

    def duration_penalty # penalizes really short or long phrases
      penalty = case 
        when duration >= 4 then    0
        when duration == 3 then -100
        when duration == 2 then -400
        when duration <= 1 then -800
      end
      penalty += case 
        when  length >= 12                  then   -1*((length*4)**1.25)
        when (length >=  3 and length < 12) then    0
        when  length ==  2                  then -150
        when  length <=  1                  then -400
      end
      penalty
    end

    def similarity_to_other_phrases(phrase_list)
      phrase_similarities = phrase_list.phrase_cross_similarities(self)
      filtered_similarities = phrase_similarities.select{ |x| x > 0.3 }
      if filtered_similarities.empty?
        similarity = 0.0
        mean_similarity = 0.0
        similarity_weight = 0
      else
        mean_similarity = filtered_similarities.inject(:+) / filtered_similarities.length.to_f
        similarity = (self.length**SIM_A) * (filtered_similarities.length**SIM_B) / (10.0**(SIM_C*mean_similarity)) 
        similarity_weight = 2
      end
      similarity_weight*similarity
    end

    def total_distance
      within_dist = 0.0
      if length > 1
        within_dist += notes[0..-2].map{ |note| note.analysis[:distance_interval_after].distance }.inject(:+)
      end

      border_dist = 0.0
      if !notes.last.analysis[:distance_interval_after].nil?
        border_dist = notes.last.analysis[:distance_interval_after].distance
      end

      return within_dist - border_dist
    end

  end
 
end

