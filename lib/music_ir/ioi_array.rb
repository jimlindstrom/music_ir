#!/usr/bin/env ruby

module MusicIR

  # Inter-onset interval (IOI) = the time delta between the start of two consecutive notes 
  class IOIArray < Array
    LOGGING = false
    
    def evaluate_quantizer(q)
      filtered_x = self.select{|x| x>0} # get rid of zero-deltas (simultaneous onsets)
      b    = filtered_x.map{|x| x.to_f/q}
      #b    = self.map{|x| x.to_f/q}
      br   = b.map{|x| x.round}
      errs = b.zip(br).map { |x| (x[0]-x[1]).to_f / x[0].to_f }
      errs.collect!{ |x| x*x }

      if LOGGING
        puts "evaluate_quantizer(self=#{self.inspect},q=#{q})"
        puts "b: #{b.inspect}"
        puts "br: #{br.inspect}"
        puts "errs: #{errs.inspect}"
      end

      err  = errs.inject{|sum,el| sum + el}
    end
    
    def quantize!
      # choose parameters
      span = 2 * (self.max - self.min).to_f / ((self.min.to_f)+0.5)
      bounded_span = [[span, 1].max, 6].min # put some bounds on it
      num_segs  = (5 + bounded_span).round
      max_depth = (3 + bounded_span).round
      #puts "span: #{span}, num_segs: #{num_segs}, max_depth: #{max_depth}"

      # find the quantization value
      q_ret = self.quantize_helper(self.min.to_f, self.max.to_f, num_segs, max_depth)

      # do the quantizing
      self.collect! {|x| (x/q_ret[:q]).round }
      return q_ret
    end

  protected

    def quantize_helper(q1, q2, num_segs, max_depth) # FIXME: make private?
      q1 = [q1,10.0].max
      delta=(q2-q1)/(num_segs-1).to_f
      qs=[q1.to_f]
      (num_segs-1).times { qs.push(qs.last+delta) }
    
      begin
        abs_errs  = qs.collect{|q| evaluate_quantizer(q).abs}
      rescue # there's a bug in here, and I don't know where.  print out some diagnostic info
        puts "quantize_helper(#{q1}, #{q2}, #{num_segs}, #{max_depth})"
        puts "qs: #{qs.inspect}"
        raise
      end
      begin
      min_err   = abs_errs.min
      rescue # there's a bug in here, and I don't know where.  print out some diagnostic info
        puts "quantize_helper(#{q1}, #{q2}, #{num_segs}, #{max_depth})"
        puts "qs: #{qs.inspect}"
        puts "abs_errs: #{abs_errs.inspect}"
        raise
      end
      min_idx   = abs_errs.index(min_err)
      min_err_q = qs[min_idx]
    
      if max_depth == 0
        return { :q => min_err_q, :err => min_err }
      else
        if min_idx == 0
          return quantize_helper(qs[0], qs[1], num_segs, max_depth-1)
        elsif min_idx == num_segs-1
          return quantize_helper(qs[num_segs-2], qs[num_segs-1], num_segs, max_depth-1)
        else
          return quantize_helper(qs[min_idx-1], qs[min_idx+1], num_segs, max_depth-1)
        end
      end
    end

  end
  
end
