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
      nq.detect_meter
      #nq.analyze! # I can't remember whether this is necessary, or just what it does...
      nq.analyze_harmony!
    end
  end
end

def mean_abs_t_score_for_factor(factor_lambda)
  abs_t_values = []
  $phrasing_vectors.each do |song_name, vector|
    nq = vector[:note_queue]
    if nq.none?{ |note| note.is_a? MusicIR::Rest }
      phrase_end_indices = vector[:phrase_boundaries].map{ |x| x[:end_idx] }
      
      boundary_scores    = []
      nonboundary_scores = []
      0.upto(nq.length-1) do |idx|
        factor_score = factor_lambda.call(nq, idx)
      
        if phrase_end_indices.include?(idx)
          boundary_scores    << factor_score
        else
          nonboundary_scores << factor_score
        end
      end
      
      boundary_scores    = boundary_scores.select{    |x| x } # ignore nils
      nonboundary_scores = nonboundary_scores.select{ |x| x } # ignore nils
      
      cur_t = t_statistic(boundary_scores, nonboundary_scores)
      abs_t_values << cur_t.abs if cur_t.finite?
    end
  end
  abs_t_values.mean
end

preprocess_note_queues
$scoring_lambdas.each_with_index do |x,i|
  $scoring_lambdas[i][:mean_abs_t] = mean_abs_t_score_for_factor(x[:lambda])
end
$scoring_lambdas = $scoring_lambdas.sort{ |x,y| y[:mean_abs_t] <=> x[:mean_abs_t] }
printf "%40s  %s\n", "Name", "Mean Abs. T Value"
$scoring_lambdas.each do |x|
  printf "%40s  %6.4f\n", x[:name], x[:mean_abs_t]
end
