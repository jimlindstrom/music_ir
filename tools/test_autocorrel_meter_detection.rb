#!/usr/bin/env ruby

require 'music_ir'

$LOAD_PATH << 'spec/vectors'
require 'meter_vectors'

class Array
  def index_of_max
    self.each_with_index.max[1]
  end
end

def product(beat1, beat2)
  case
  when !beat1 && !beat2 then 1.0
  when !beat1 &&  beat2 then 0.0
  when  beat1 && !beat2 then 0.0
  when  beat1 &&  beat2 then 1.0
  end
end

def autocorrel(beat_array, num_lags)
  ac = []
  0.upto(num_lags) do |lag|
    sum = 0
    lag.upto(beat_array.length-1) do |idx|
      sum += product(beat_array[idx-lag], beat_array[idx])
    end
    ac << sum
  end
  return ac
end

# see: http://ismir2005.ismir.net/proceedings/1105.pdf
# by augmenting simple autocorrelation with the entropy of the phase information at each lag,
# one acquires a more accurate estimate of the metric strength of eahc lag.
def autocorrel_times_phase_entropy(beat_array, num_lags)
  ac = []
  0.upto(num_lags) do |lag|
    sum = 0
    lag.upto(beat_array.length-1) do |idx|
      sum += product(beat_array[idx-lag], beat_array[idx])
    end
    ac << sum * entropy_of_autocorrel_phase(autocorrel_phase(beat_array, period=(lag+0)))
  end
  return ac
end

def autocorrel_phase(beat_array, period)
  return nil if period<1
  acp = [0]*period
  0.upto(beat_array.length-1) do |idx|
    acp[idx%period] += 1 if beat_array[idx]
  end
  return acp
end

def entropy_of_autocorrel_phase(acp)
  return 1.0 if !acp

  x = Markov::RandomVariable.new(Markov::LiteralAlphabet.new((0..(acp.length-1)).to_a))
  acp.each_with_index{ |y,i| x.observe!(i, y) }
  return x.entropy
end

$meter_vectors.each do |song_name, vector|
  puts song_name
  
  m = vector[:meter]
  puts "meter: #{m.beats_per_measure}/#{m.beat_unit} (#{m.subbeats_per_beat}x)"

  puts "M:        " + (" "*(6*m.subbeats_per_beat*m.beats_per_measure)) + "*"
  puts "B:        " + (" "*(6*m.subbeats_per_beat                    )) + "*"

  nq = vector[:note_queue]
  beat_array = nq.beat_array
  
  ac = autocorrel(beat_array, num_lags=20)
  puts "AC:  " + ac.map{ |x| sprintf("%6.1f", x) }.join("")
  puts "          " + (" "*(6*(1+ac[1..-1].index_of_max))) + "^"
  
  ace = autocorrel_times_phase_entropy(beat_array, num_lags=20)
  puts "ACE: " + ace.map{ |x| sprintf("%6.1f", x) }.join("")
  puts "          " + (" "*(6*(1+ace[1..-1].index_of_max))) + "^"

  2.upto(4) do |period|
    puts "#{period}: " + (ace[period*1]+ace[period*2]+ace[period*3]).to_s
  end

  puts
end
