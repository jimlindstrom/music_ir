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
      notes.map{ |note| note.duration.val }.inject(:+).to_f
    end

    DIST_WEIGHT    =    3.0 # increasing this favors phrases that contain low-distance intervals
    DUR_DEV_WEIGHT = -250.0 # decreasing this favors phrases that are closer to the mean duration

    def score(phrase_list)
      total  = duration_penalty
      total += length_penalty
      total -= DIST_WEIGHT*sum_of_interior_distances
      total += DIST_WEIGHT*distance_after
      total += DUR_DEV_WEIGHT*phrase_list.phrase_duration_penalty_for(self)
      total += mean_similarity_to_other_phrases(phrase_list)
      total += num_similar_phrases(phrase_list)
      total += length_times_num_similar_phrases(phrase_list)
      total += length_times_mean_similarity_to_other_phrases(phrase_list)

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

    def duration_penalty # penalizes really short or long phrases
      case 
        when duration >= 4 then    0
        when duration == 3 then -100
        when duration == 2 then -400
        when duration <= 1 then -800
      end
    end

    def length_penalty # penalizes really short or long phrases
      case 
        when  length >= 12                  then   -1*((length*4)**1.25)
        when (length >=  3 and length < 12) then    0
        when  length ==  2                  then -150
        when  length <=  1                  then -400
      end
    end

    def similarities_to_other_phrases(phrase_list)
      phrase_list.phrase_cross_similarities(self)
                 .select{ |x| x > 0.3 }
    end

    def mean_similarity_to_other_phrases(phrase_list)
      similarities = similarities_to_other_phrases(phrase_list)
      return 0.0 if similarities.empty?
      return similarities.inject(:+) / similarities.length.to_f
    end

    def num_similar_phrases(phrase_list)
      similarities_to_other_phrases(phrase_list).length
    end

    def length_times_num_similar_phrases(phrase_list)
      self.length * similarities_to_other_phrases(phrase_list).length
    end

    def length_times_mean_similarity_to_other_phrases(phrase_list)
      self.length * similarities_to_other_phrases(phrase_list).length
    end

    def sum_of_interior_distances
      if length > 1
        return notes[0..-2].map{ |note| note.analysis[:distance_interval_after].distance }.inject(:+)
      end
      return 0.0
    end

    def distance_after
      if notes.last.analysis[:distance_interval_after]
        return notes.last.analysis[:distance_interval_after].distance
      end
      return 0.0
    end

  end
 
end

