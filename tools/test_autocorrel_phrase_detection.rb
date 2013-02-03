#!/usr/bin/env ruby

require 'music_ir'

$LOAD_PATH << 'spec/vectors'
require 'meter_vectors'

class Predictor
  def initialize
    @correct = 0
    @incorrect = 0
  end
  def observe!(actual, expected)
    if actual == expected
      @correct += 1
    else
      @incorrect += 1
    end
  end
  def accuracy
    @correct.to_f / (@correct + @incorrect)
  end
end

class Array
  def index_of_max
    self.each_with_index.max[1]
  end
end

def phenomenal_accent(beat)
 return 0.0 if !beat
 return 1.0 if  beat
end

def product(beat1, beat2)
  # this method is now implemented as returning the amount of agreement in
  # phenomenal accent between two beats.
  pa1 = phenomenal_accent(beat1)
  pa2 = phenomenal_accent(beat2)
  1 - (pa1 - pa2)**2
end

def autocorrel(beat_array, num_lags)
  # this method is far likelier to detect the beat than the meter or the phrase.
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
  # my impression so far is that this method is MUCH more likely to detect the phrase length
  # than the beat or meter. 
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

def subbeats_per_beat_confidence(ac, subbeats_per_beat)
  case subbeats_per_beat
    when 1 then ac[1] / [ac[2], ac[4]].max
    when 2 then ac[2] / [ac[1], ac[4]].max
    when 4 then ac[4] / [ac[1], ac[2]].max
  end
end

def subbeats_per_measure_confidence(ac, subbeats_per_measure, subbeats_per_beat)
  beats_per_meas = [2, 3, 4, 5, 6]
  subbeats_per_meas = beats_per_meas.map{ |x| x*subbeats_per_beat }
  subbeats_per_meas_strength = subbeats_per_meas.map{ |x| ac[x] }

  idx = subbeats_per_meas.index{ |x| x == subbeats_per_measure }
  other_strengths = subbeats_per_meas_strength - [subbeats_per_meas_strength[idx]]
  max_other_strength = other_strengths.max
  subbeats_per_meas_strength[idx] / max_other_strength
end

def calc_beat_unit(subbeats_per_beat, beats_per_meas)# FIXME: this isn't right, but I can't figure out what it should do....
  case 
  when (beats_per_meas==6) && (subbeats_per_beat==1) then  4 # 1 meas = 6 quarter notes
  when (beats_per_meas==6) && (subbeats_per_beat==2) then  8 # 1 meas = 6 eighth notes
  when (beats_per_meas==6) && (subbeats_per_beat==4) then 16 # 1 meas = 6 sixteenth notes

  when (beats_per_meas==5) && (subbeats_per_beat==1) then  4 # 1 meas = 5 quarter notes
  when (beats_per_meas==5) && (subbeats_per_beat==2) then  8 # 1 meas = 5 eighth notes
  when (beats_per_meas==5) && (subbeats_per_beat==4) then 16 # 1 meas = 5 sixteenth notes

  when (beats_per_meas==4) && (subbeats_per_beat==1) then  4 # 1 meas = 4 quarter notes
  when (beats_per_meas==4) && (subbeats_per_beat==2) then  8 # 1 meas = 4 eighth notes
  when (beats_per_meas==4) && (subbeats_per_beat==4) then 16 # 1 meas = 4 sixteenth notes

  when (beats_per_meas==3) && (subbeats_per_beat==1) then  4 # 1 meas = 3 quarter notes
  when (beats_per_meas==3) && (subbeats_per_beat==2) then  8 # 1 meas = 3 eighth notes
  when (beats_per_meas==3) && (subbeats_per_beat==4) then 16 # 1 meas = 3 sixteenth notes

  when (beats_per_meas==2) && (subbeats_per_beat==1) then  4 # 1 meas = 2 quarter notes
  when (beats_per_meas==2) && (subbeats_per_beat==2) then  8 # 1 meas = 2 eighth notes
  when (beats_per_meas==2) && (subbeats_per_beat==4) then 16 # 1 meas = 2 sixteenth notes
  end
end

def p_of_meter(beats_per_meas, beat_unit)
  case 
  when (beats_per_meas==6) && (beat_unit== 4) then 0.06666666666667
  when (beats_per_meas==6) && (beat_unit== 8) then 0.06666666666667
  when (beats_per_meas==6) && (beat_unit==16) then 0.06666666666667-0.01

  when (beats_per_meas==5) && (beat_unit== 4) then 0.06666666666667-0.01
  when (beats_per_meas==5) && (beat_unit== 8) then 0.06666666666667-0.01
  when (beats_per_meas==5) && (beat_unit==16) then 0.06666666666667-0.01-0.01

  when (beats_per_meas==4) && (beat_unit== 4) then 0.06666666666667+0.01+0.01+0.01
  when (beats_per_meas==4) && (beat_unit== 8) then 0.06666666666667+0.01+0.01
  when (beats_per_meas==4) && (beat_unit==16) then 0.06666666666667+0.01-0.01

  when (beats_per_meas==3) && (beat_unit== 4) then 0.06666666666667+0.01
  when (beats_per_meas==3) && (beat_unit== 8) then 0.06666666666667
  when (beats_per_meas==3) && (beat_unit==16) then 0.06666666666667-0.01

  when (beats_per_meas==2) && (beat_unit== 4) then 0.06666666666667
  when (beats_per_meas==2) && (beat_unit== 8) then 0.06666666666667-0.01
  when (beats_per_meas==2) && (beat_unit==16) then 0.06666666666667-0.01
  end
end

def detect_meter(ac)
  options = []
  [1, 2, 4].each do |subbeats_per_beat|
    [2, 3, 4, 5, 6].each do |beats_per_measure|
      subbeats_per_measure = subbeats_per_beat*beats_per_measure
      beat_unit = calc_beat_unit(subbeats_per_beat, beats_per_measure)
      confidence  = subbeats_per_beat_confidence(ac, subbeats_per_beat)
      confidence *= subbeats_per_measure_confidence(ac, subbeats_per_measure, subbeats_per_beat)
      confidence *= p_of_meter(beats_per_measure, beat_unit)
      options << { :subbeats_per_measure => subbeats_per_measure,
                   :beats_per_measure    => beats_per_measure,
                   :subbeats_per_beat    => subbeats_per_beat,
                   :confidence           => confidence }
    end
  end
  best = options.sort{ |x,y| x[:confidence] <=> y[:confidence] }.last
  return [ best[:subbeats_per_beat], best[:beats_per_measure], best[:confidence] ]
end

beatModel = Predictor.new
measModel = Predictor.new
$meter_vectors.each do |song_name, vector|
  next if vector[:note_queue].any?{ |x| x.is_a? MusicIR::Rest }

  puts song_name
  
  m = vector[:meter]
  puts "meter: #{m.beats_per_measure}/#{m.beat_unit} (#{m.subbeats_per_beat}x)"

  puts "M:        " + (" "*(6*m.subbeats_per_beat*m.beats_per_measure)) + "M"
  puts "B:        " + (" "*(6*m.subbeats_per_beat                    )) + "B"

  nq = vector[:note_queue]
  beat_array = nq.beat_array
  
  ac = autocorrel(beat_array, num_lags=25)

  subbeats_per_beat, beats_per_meas, confidence = detect_meter(ac)

  puts "AC:  " + ac.map{ |x| sprintf("%6.1f", x) }.join("")
  puts "          " + (" "*(6*subbeats_per_beat)) + "B"
  puts "          " + (" "*(6*beats_per_meas*subbeats_per_beat)) + "M"
  puts "          " + (" "*(6*(1+ac[1..-1].index_of_max))) + "^"

  puts "meter: #{beats_per_meas}/#{calc_beat_unit(subbeats_per_beat, beats_per_meas)} (#{subbeats_per_beat}x)"
  puts "confidence: " + sprintf("%.2f", confidence)

  beatModel.observe!(subbeats_per_beat, m.subbeats_per_beat)
  measModel.observe!(beats_per_meas, m.beats_per_measure)

  puts
end

puts "beat: #{sprintf("%.1f", 100.0*beatModel.accuracy)}% accuracy"
puts "meas: #{sprintf("%.1f", 100.0*measModel.accuracy)}% accuracy"
