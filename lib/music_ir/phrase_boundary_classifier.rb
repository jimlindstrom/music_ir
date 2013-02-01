module MusicIR

  class PhraseBoundaryClassifier
    FILENAME = "tools/phrases/boundary_classifier_matrix.txt"
    def initialize
      return if !File.exists?(FILENAME)

      rows=eval(File.read(FILENAME))
      
      labels  = rows.map{ |row| row[0]     }
      x       = rows.map{ |row| row[1..-1] }
      samples = x.map do |row|
        sample = {}
        row.each_with_index do |x, idx|
          if x
            sample[idx] = x
          end
        end
        sample
      end

      pa = LParameter.new
      pa.solver_type = MCSVM_CS 
      pa.eps = 0.1
      problem = LProblem.new(labels, samples, 1.0)
      @model = LModel.new(problem, pa)
    end

    @@instance = PhraseBoundaryClassifier.new

    def self.instance
      @@instance
    end

    def self.num_factors
      10
    end

    def factors(note_queue, note_idx)
      [ note_queue.ratio_of_cur_and_prev_duration(note_idx),
        note_queue.ratio_of_cur_and_next_duration(note_idx),
        note_queue.is_end_of_measure?(note_idx),
        note_queue.is_subbeat_0?(note_idx),
        note_queue.is_different_from_next_chord?(note_idx),
        note_queue.interval_after(note_idx),
        note_queue.is_repeated_pitch?(note_idx),
        note_queue.is_next_chord_tonic?(note_idx),
        note_queue.ratio_of_abs_interval_before_vs_after(note_idx),
        note_queue.is_same_as_next_pitch?(note_idx) ]
    end

    def is_end_of_phrase_boundary?(note_queue, note_idx)
      fs = factors(note_queue, note_idx)
      sample = {}
      fs.each_with_index do |x, idx|
        if x
          sample[idx] = x
        end
      end
      raise RuntimeError.new("@model is nil. Can't predict") if !@model
      @model.predict(sample) == 1
    end

    def end_of_phrase_boundary_strength(note_queue, note_idx)
      fs = factors(note_queue, note_idx)
      sample = {}
      fs.each_with_index do |x, idx|
        if x
          sample[idx] = x
        end
      end
      raise RuntimeError.new("@model is nil. Can't predict") if !@model
      winner, scores = @model.predict_values(sample)
      #raise RuntimeError.new("scores are bogus: #{scores.inspect}") if !scores || !scores[0] || !scores[1]
      return (scores[1] || 0.0) - (scores[0] || 0.0)
    end

    def end_of_phrase_indices(note_queue)
      (0..(note_queue.length-1)).select{ |note_idx| is_end_of_phrase_boundary?(note_queue, note_idx) }
    end

  end

end
