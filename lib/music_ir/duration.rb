#!/usr/bin/env ruby

module MusicIR
  
  class Duration
    def initialize(new_val)
      set_val(new_val)
    end
  
    def self.num_values
      128
    end
  
    def set_val(new_val)
      raise ArgumentError.new("value (#{new_val}) cannot be negative") if new_val < 0
      raise ArgumentError.new("value (#{new_val}) cannot be > 127") if new_val > 127
  
      @val = new_val
    end
  
    def val
      return @val
    end
  
    def similarity_to(d)
      return 0.00 if d.nil?
      delta = Float(d.val - @val)
      max_delta = 8.0
      diff = delta**2 / max_delta**2
      flattened_diff = diff
      clipped_diff = [ 0.0, [ 1.0, flattened_diff ].min ].max
      similarity = 1.0 - clipped_diff
      return similarity
    end
  
  end

end

