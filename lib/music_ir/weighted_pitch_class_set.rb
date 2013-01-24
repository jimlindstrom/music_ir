#!/usr/bin/env ruby

module MusicIR
  
  class WeightedPitchClassSet
    def initialize
      @weight = [nil]*12
    end

    def add(pc, w)
      @weight[pc.val] = (@weight[pc.val] || 0.0) + w
    end

    def weight(pc)
      @weight[pc.val]
    end

    def pitch_classes_above_threshold(w)
      pcs = PitchClassSet.new

      h=Hash[*(0..11).zip(@weight).flatten]
      h.keep_if{ |k,v| !v.nil? and v>=w}
      h.map{ |k,v| pcs.add(PitchClass.new(k)) }

      return pcs
    end

    def top_n_pitch_classes(n)
      pcs = PitchClassSet.new

      a = (0..11).zip(@weight).map{ |x,y| {:pc=>x, :w=>y} }
      a.keep_if{ |a| !a[:w].nil? }
      a.sort!{ |x,y| y[:w] <=> x[:w] }
      a[0..(n-1)].map{ |x| pcs.add(PitchClass.new(x[:pc])) }

      return pcs
    end

    def best_match_key(templates)
      best_err = 1e10
      best_template_idx = -1
      best_pitch_class_idx = -1
      
      sum_of_weights = @weight.map{ |x| x || 0 }.inject(:+)
      tmp_vector = @weight.map{ |x| (x || 0) / sum_of_weights.to_f }
      0.upto(11) do |pitch_class_idx|
        templates.each_with_index do |template, template_idx|
          err = template.zip(tmp_vector).map{ |x| (x[1]-x[0])**2 }.inject(:+)
          if err < best_err
            best_err = err
            best_template_idx = template_idx
            best_pitch_class_idx = pitch_class_idx
          end
        end
        tmp_vector = tmp_vector[1..-1] + tmp_vector[0..0]
      end

      { :template_idx => best_template_idx, :pitch_class => PitchClass.new(best_pitch_class_idx), :err => best_err }
    end
  end

end

