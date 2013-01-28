module MusicIR

  class PhraseBoundaryClassifier
    FILENAME = "tools/phrases/boundary_classifier_matrix.txt"
    def initialize
      rows=eval(File.read(FILENAME))
      
      labels  = rows.map{ |row| row[0]     }
      x       = rows.map{ |row| row[1..-1] }
      samples = x.map do |row|
        #if row.length != PhraseBoundaryClassifier.num_factors
        #  raise RuntimeError.new("row only has #{row.length} elements. must have #{PhraseBoundaryClassifier.num_factors} elements")
        #end
        sample = {}
        row.each_with_index do |x, idx|
          if x
            sample[idx] = x
          end
        end
        sample
      end
      max_feature = samples.map {|sample| sample.keys.max}.max
      problem = RubyLinear::Problem.new(labels, samples, 1.0, max_feature)
      @model = RubyLinear::Model.new(problem, :solver => RubyLinear::L1R_L2LOSS_SVC)
    end

    @@instance = PhraseBoundaryClassifier.new

    def self.instance
      @@instance
    end

    def self.num_factors
      10
    end

    def factor(note_queue, note_idx, factor_idx)
      case factor_idx
      when 0 # cur dur/prev dur
        if (note_idx-1) >= 0
          return note_queue[note_idx+0].duration.val.to_f / note_queue[note_idx-1].duration.val
        else
          return nil # undefined
        end
      when 1 # cur dur/next dur
        if (note_idx+1) < note_queue.length
          return note_queue[note_idx+0].duration.val.to_f / note_queue[note_idx+1].duration.val
        else
          return nil # undefined
        end
      when 2 # is end of measure
        if note_queue[note_idx].analysis[:beat_position] && ((note_idx+1) < note_queue.length)
          cur_note_meas  = note_queue[note_idx+0].analysis[:beat_position].measure
          next_note_meas = note_queue[note_idx+1].analysis[:beat_position].measure
          return (next_note_meas > cur_note_meas) ? 1 : 0
        else
          return nil # undefined
        end
      when 3 # is subbeat 0
        if note_queue[note_idx].analysis[:beat_position]
          return (note_queue[note_idx].analysis[:beat_position].subbeat == 0) ? 1 : 0
        else
          return nil # undefined
        end
      when 4 # is different from next chord
        if ((note_idx-1) >= 0) && note_queue[note_idx-1].analysis[:chord] && note_queue[note_idx].analysis[:chord]
          return (note_queue[note_idx-1].analysis[:chord].to_s == note_queue[note_idx].analysis[:chord].to_s) ? 1 : 0
        else
          return nil # undefined
        end
      when 5 # next interval
        if (note_idx+1) < note_queue.length
          return (note_queue[note_idx+1].pitch.val - note_queue[note_idx+0].pitch.val).abs
        else
          return nil # undefined
        end
      when 6 # repeated pitch
        if (note_idx-1) >= 0
          return (note_queue[note_idx-1].pitch.val == note_queue[note_idx+0].pitch.val) ? 1 : 0
        else
          return nil # undefined
        end
      when 7 # is next tonic chord
        if ((note_idx+1) < note_queue.length) && note_queue[note_idx+1].analysis[:key] && note_queue[note_idx+1].analysis[:chord]
          return (note_queue[note_idx+1].analysis[:key].to_s == note_queue[note_idx+1].analysis[:chord].to_s) ? 1 : 0
        else
          return nil # undefined
        end
      when 8 # before abs interval/after abs interval
        if ((note_idx-1) >= 0) && ((note_idx+1) < note_queue.length)
          interval_before = (note_queue[note_idx+0].pitch.val - note_queue[note_idx-1].pitch.val).abs
          interval_after  = (note_queue[note_idx+1].pitch.val - note_queue[note_idx+0].pitch.val).abs
          return (interval_before+1.0) / (interval_after+1.0)
        else
          return nil # undefined
        end
      when 9 # next repeated pitch
        if (note_idx+1) < note_queue.length
          return (note_queue[note_idx+1].pitch.val == note_queue[note_idx+0].pitch.val) ? 1 : 0
        else
          return nil # undefined
        end
      end
    end

    def factors(note_queue, note_idx)
      (0..(PhraseBoundaryClassifier.num_factors-1)).map{ |factor_idx| factor(note_queue, note_idx, factor_idx) }
    end

    def is_end_of_phrase_boundary?(note_queue, note_idx)
      fs = factors(note_queue, note_idx)
      sample = {}
      fs.each_with_index do |x, idx|
        if x
          sample[idx] = x
        end
      end
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
      winner, scores = @model.predict_values(sample)
      return scores[1] || 0.0
    end

    def end_of_phrase_indices(note_queue)
      (0..(note_queue.length-1)).select{ |note_idx| is_end_of_phrase_boundary?(note_queue, note_idx) }
    end

  end

end
