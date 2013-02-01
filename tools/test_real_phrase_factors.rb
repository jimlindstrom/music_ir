#!/usr/bin/env ruby

require 'music_ir'

$LOAD_PATH << 'spec/vectors'
require 'meter_vectors'

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

def abs_t_score_for_factor(rows, col_idx)
  phrase_scores    = []
  nonphrase_scores = []
  rows.each do |row|
    if row[col_idx]
      if row[0] == 1
        phrase_scores << row[col_idx]
      else
        nonphrase_scores << row[col_idx]
      end
    end
  end
  t_statistic(phrase_scores, nonphrase_scores).abs
end

filename = ARGV[0]
rows=eval(File.read(filename))
rows = rows.map{ |row| row + [rand] } # add a random column, for a control.

factor_names = [ "duration > 15",
                 "duration > 10",
                 "duration <  5",
                 "duration <  3",
                 "length > 11",
                 "length >  9",
                 "length <  4",
                 "length <  3",
                 "mean_similarity_to_other_phrases(phrase_list)",
                 "num_similar_phrases(phrase_list)",
                 "length_times_num_similar_phrases(phrase_list)",
                 "length_times_mean_similarity_to_other_phrases(phrase_list)",
                 "sum_of_interior_distances",
                 "distance_after",
                 "boundary_strength_of_end",
                 "ratio_of_boundary_strength_of_end_vs_max",
                 "ratio_of_boundary_strength_of_max_vs_min",
                 "ratio_of_last_two_durations",
                 "ratio_of_last_two_intervals",
                 "random (control)" ]

factors = factor_names.each_with_index.map do |factor_name, idx|
  { :name => factor_name,
    :abs_t => abs_t_score_for_factor(rows, 1+idx) }
end
factors.sort!{ |x,y| y[:abs_t] <=> x[:abs_t] }
printf "%60s  %s\n", "Name", "Abs. T Value"
factors.each do |factor|
  printf "%60s  %6.4f\n", factor[:name], factor[:abs_t]
end
