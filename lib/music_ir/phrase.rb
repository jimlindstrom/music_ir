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

    def score(phrase_list)
      fs = classifier_factors(phrase_list)
      sample = {}
      fs.each_with_index do |x, idx|
        if x
          sample[idx] = x
        end
      end
      winner, scores = @@model.predict_values(sample)
      return scores[1]-scores[0]
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

    def duration_penalty # FIXME: this isn't (shouldn't) be used any more.
      case 
        when duration >= 4 then    0
        when duration == 3 then -100
        when duration == 2 then -400
        when duration <= 1 then -800
      end
    end

    def duration_is_less_than_5?
      (duration < 5) ? 1 : 0
    end

    def duration_is_less_than_3?
      (duration < 3) ? 1 : 0
    end

    def duration_is_more_than_10?
      (duration > 10) ? 1 : 0
    end

    def duration_is_more_than_15?
      (duration > 15) ? 1 : 0
    end

    def length_penalty # FIXME: isn't (shouldn't) be used
      case 
        when  length >= 12                  then   -1*((length*4)**1.25)
        when (length >=  3 and length < 12) then    0
        when  length ==  2                  then -150
        when  length <=  1                  then -400
      end
    end

    def length_is_less_than_4?
      (length < 4) ? 1 : 0
    end

    def length_is_less_than_3?
      (length < 3) ? 1 : 0
    end

    def length_is_more_than_9?
      (length > 9) ? 1 : 0
    end

    def length_is_more_than_11?
      (duration > 11) ? 1 : 0
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
      self.length * num_similar_phrases(phrase_list)
    end

    def length_times_mean_similarity_to_other_phrases(phrase_list)
      self.length * mean_similarity_to_other_phrases(phrase_list)
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

    def boundary_strength_of_end
      pbc = MusicIR::PhraseBoundaryClassifier.instance
      pbc.end_of_phrase_boundary_strength(@note_queue, @end_idx)
    end

    def ratio_of_boundary_strength_of_end_vs_max
      return nil if @start_idx==@end_idx
      pbc =  MusicIR::PhraseBoundaryClassifier.instance
      boundary_strengths = (@start_idx..@end_idx).map{ |note_idx| pbc.end_of_phrase_boundary_strength(@note_queue, note_idx) }
      boundary_strengths[-1] / (boundary_strengths[0..-2].max + 1.0)
    end

    def ratio_of_boundary_strength_of_max_vs_min
      return nil if @start_idx==@end_idx
      pbc =  MusicIR::PhraseBoundaryClassifier.instance
      boundary_strengths = (@start_idx..@end_idx).map{ |note_idx| pbc.end_of_phrase_boundary_strength(@note_queue, note_idx) }
      boundary_strengths.max / (boundary_strengths.min + 1.0)
    end

    def ratio_of_last_two_durations
      return nil if ((@end_idx-@start_idx)<1)
      last_duration = @note_queue[@end_idx-0].duration.val
      prev_duration = @note_queue[@end_idx-1].duration.val
      (1.0 + prev_duration) / (1.0 + last_duration)
    end

    def ratio_of_last_two_intervals
      return nil if ((@end_idx-@start_idx)<2)
      last_interval = (@note_queue[@end_idx-0].pitch.val - @note_queue[@end_idx-1].pitch.val).abs
      prev_interval = (@note_queue[@end_idx-1].pitch.val - @note_queue[@end_idx-2].pitch.val).abs
      if last_interval==0
        return (prev_interval>0) ? 100 : -100
      end
      prev_interval.to_f / last_interval
    end

    def classifier_factors(phrase_list)
      [ self.duration_is_more_than_15?,
        self.duration_is_more_than_10?,
        self.duration_is_less_than_5?,
        self.duration_is_less_than_3?,
        self.length_is_more_than_11?,
        self.length_is_more_than_9?,
        self.length_is_less_than_4?,
        self.length_is_less_than_3?,
        self.mean_similarity_to_other_phrases(phrase_list),
        self.num_similar_phrases(phrase_list),
        self.length_times_num_similar_phrases(phrase_list),
        self.length_times_mean_similarity_to_other_phrases(phrase_list),
        self.sum_of_interior_distances,
        self.distance_after,
        self.boundary_strength_of_end,
        self.ratio_of_boundary_strength_of_end_vs_max,
        self.ratio_of_boundary_strength_of_max_vs_min,
        self.ratio_of_last_two_durations,
        self.ratio_of_last_two_intervals ]
    end

    def self.model
      filename = "tools/phrases/phrase_classifier_matrix.txt"
      return nil if !File.exists?(filename)
      rows=eval(File.read(filename))
      return nil if !rows
      
      labels  = rows.map{ |row| row[0]     }
      x       = rows.map{ |row| row[1..-1] }
      samples = x.map do |row|
        sample = {}
        row.each_with_index do |val, idx|
          if val
            sample[idx] = val
          end
        end
        sample
      end
      max_feature = samples.map {|sample| sample.keys.max}.max
      problem = RubyLinear::Problem.new(labels, samples, 1.0, max_feature)
      RubyLinear::Model.new(problem, :solver => RubyLinear::L1R_L2LOSS_SVC, :weights=>{1 => 2.9})
    end
    @@model = self.model

  end
 
end

