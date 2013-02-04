#!/usr/bin/env ruby

require 'music_ir'

$LOAD_PATH << 'spec/vectors'
require 'meter_vectors'

$LOAD_PATH << 'tools'
require 'phrase_boundary_factors'

class Array
  def mean
    self.inject(:+).to_f / self.length
  end
  def variance
    m = self.mean
    self.map{ |x| (x-m)**2 }.inject(:+) / ( self.length - 1 )
  end
  def stdev
    variance**0.5
  end
end

# FIXME: not sure if this is the right equation. I'm using this:
# http://en.wikipedia.org/wiki/Student's_t-test#Equal_sample_sizes.2C_equal_variance
def t_statistic(arr1, arr2)
  numer = arr1.mean - arr2.mean

  pooled_stdev = (0.5*(arr1.variance + arr2.variance))**0.5
  other_factor = ((1.0/arr1.length) + (1.0/arr2.length))**0.5
  denom = pooled_stdev * other_factor

  numer / denom
end

def preprocess_note_queues
  $phrasing_vectors.each do |song_name, vector|
    nq = vector[:note_queue]
    if nq.none?{ |note| note.is_a? MusicIR::Rest }
      nq.analyze_harmony!
    end
  end
end

def generate_matrix
  rows = []
  $phrasing_vectors.each do |song_name, vector|
    nq = vector[:note_queue]
    if nq.none?{ |note| note.is_a? MusicIR::Rest }
      phrase_end_indices = vector[:phrase_boundaries].map{ |x| x[:end_idx] }
      
      0.upto(nq.length-1) do |idx|
        row = []
        if phrase_end_indices.include?(idx)
          row << 1 # is a boundary
        else
          row << 0 # not a boundary
        end

        $scoring_lambdas.each do |x|
          row << factor_score = x[:lambda].call(nq, idx)
        end
        rows << row
      end
    end
  end
  rows
end

preprocess_note_queues
rows = generate_matrix
puts rows.inspect
