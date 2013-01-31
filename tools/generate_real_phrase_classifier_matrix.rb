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
      nq.analyze!
      nq.analyze_harmony!
    end
  end
end

def generate_matrix
  rows = []
  $phrasing_vectors.each do |song_name, vector|
    nq = vector[:note_queue]
    if nq.none?{ |note| note.is_a? MusicIR::Rest }

      # correct examples
      correct_phrases = MusicIR::PhraseList.new(nq)
      vector[:phrase_boundaries].each do |phrase|
        correct_phrases.push MusicIR::Phrase.new(nq, phrase[:start_idx], phrase[:end_idx])
      end
      correct_phrases.each do |phrase|
        row = []
        row << 1 # is a real phrase
        row += phrase.classifier_factors(correct_phrases)
        rows << row
      end

      # incorrect examples
      10.times do
        incorrect_phrases = MusicIR::PhraseList.new(nq)
        ends_of_phrase = []
        possible_ends_of_phrase = (1..(nq.length-2)).to_a
        (correct_phrases.length-1).times do
          x = possible_ends_of_phrase.sample
          possible_ends_of_phrase -= [x]
          ends_of_phrase << x
        end
        ends_of_phrase.sort!{ |x,y| x <=> y }
        ([-1] + ends_of_phrase + [nq.length-1]).each_cons(2) do |pair|
          incorrect_phrases.push MusicIR::Phrase.new(nq, pair[0]+1, pair[1])
        end

        incorrect_phrases.each do |phrase|
          row = []
          row << 0 # isn't a real phrase
          row += phrase.classifier_factors(correct_phrases)
          rows << row
        end
      end
    end
  end
  rows
end

preprocess_note_queues
rows = generate_matrix
puts rows.inspect
