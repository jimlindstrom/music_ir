#!/usr/bin/env ruby

require 'music_ir'

$LOAD_PATH << 'spec/vectors'
require 'meter_vectors'
require 'meter_vectors2'

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
      puts "WRONG!"
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

  def autocorrelation(num_lags)
    ac = []
    0.upto(num_lags) do |lag|
      sum = 0
      lag.upto(self.length-1) do |idx|
        sum += (self[idx-lag] * self[idx])
      end
      ac << sum
    end
    return ac
  end

  def xor_autocorrelation(num_lags)
    ac = []
    0.upto(num_lags) do |lag|
      sum = 0
      lag.upto(self.length-1) do |idx|
        sum += (1 - (self[idx-lag] - self[idx])**2)
      end
      ac << sum
    end
    return ac
  end
end

def subbeats_per_beat_confidence(ac, subbeats_per_beat)
  case subbeats_per_beat
    when 1 then ac[1] / [ac[2], ac[4]].max
    when 2 then ac[2] / [ac[1], ac[4]].max
    when 4 then ac[4] / [ac[1], ac[2]].max
  end
end

def subbeats_per_measure_confidence(ac, subbeats_per_measure, subbeats_per_beat)
  my_strength = ac[subbeats_per_measure]

  possible_beats_per_measure    = [2, 3, 4, 5, 6]
  possible_subbeats_per_measure = possible_beats_per_measure.map{ |x| x*subbeats_per_beat }
  other_subbeats_per_measure    = possible_subbeats_per_measure - [subbeats_per_measure]
  max_other_strength = other_subbeats_per_measure.map{ |x| ac[x] }.max

  my_strength / max_other_strength
end

def infer_meter(ac, subbeats_per_measure)
  puts "inferring based on subbeats_per_measure=#{subbeats_per_measure}"
  case subbeats_per_measure
  when 2#2*1
    MusicIR::Meter.new(beats_per_measure=2, beat_unit=4, subbeats_per_beat=1)
  when 3#3*1
    MusicIR::Meter.new(beats_per_measure=3, beat_unit=4, subbeats_per_beat=1)
  when 4#4*1, 2*2
    puts "(ac[8] > 0.8*ac[4]) -> (#{ac[8]} > #{0.8*ac[4]})"
    if ac[8] > 0.8*ac[4]
      MusicIR::Meter.new(beats_per_measure=4, beat_unit=4, subbeats_per_beat=1)
    else
      MusicIR::Meter.new(beats_per_measure=2, beat_unit=4, subbeats_per_beat=2)
    end
  when 5#5*1
    MusicIR::Meter.new(beats_per_measure=5, beat_unit=4, subbeats_per_beat=1)
  when 6#6*1, 3*2
    puts "(ac[12] > ac[6]) -> (#{ac[12]} > #{ac[6]})"
    if ac[12] > ac[6]
      MusicIR::Meter.new(beats_per_measure=6, beat_unit=4, subbeats_per_beat=1)
    else
      MusicIR::Meter.new(beats_per_measure=3, beat_unit=4, subbeats_per_beat=2)
    end
  when 8#4*2, 2*4
    puts "(ac[16] > 0.7*ac[8]) -> (#{ac[16]} > #{0.7*ac[8]})"
    if ac[16] > 0.7*ac[8]
      MusicIR::Meter.new(beats_per_measure=4, beat_unit=4, subbeats_per_beat=2)
    else
      MusicIR::Meter.new(beats_per_measure=2, beat_unit=4, subbeats_per_beat=4)
    end
  when 10#5*2
    MusicIR::Meter.new(beats_per_measure=5, beat_unit=4, subbeats_per_beat=2)
  when 12#6*2, 3*4
    puts "(ac[24] > 0.9*ac[12]) -> (#{ac[24]} > #{0.9*ac[12]})"
    if ac[24] > 0.9*ac[12]
      MusicIR::Meter.new(beats_per_measure=6, beat_unit=4, subbeats_per_beat=2)
    else
      MusicIR::Meter.new(beats_per_measure=3, beat_unit=4, subbeats_per_beat=4)
    end
  when 16#4*4
    MusicIR::Meter.new(beats_per_measure=4, beat_unit=4, subbeats_per_beat=4)
  when 20#5*4
    MusicIR::Meter.new(beats_per_measure=5, beat_unit=4, subbeats_per_beat=4)
  when 24#6*4
    MusicIR::Meter.new(beats_per_measure=6, beat_unit=4, subbeats_per_beat=4)
  end
end

def detect_meter(ac)
  options = []
  MusicIR::Meter::ALLOWED_BEATS_PER_MEASURE.each do |beats_per_measure|
    MusicIR::Meter::ALLOWED_SUBBEATS_PER_BEAT.each do |subbeats_per_beat|
      subbeats_per_measure = subbeats_per_beat * beats_per_measure
  
      confidence  = subbeats_per_beat_confidence(ac, subbeats_per_beat)
      confidence *= subbeats_per_measure_confidence(ac, subbeats_per_measure, subbeats_per_beat)
  
      options << { :subbeats_per_measure => subbeats_per_measure,
                   :beats_per_measure    => beats_per_measure,
                   :subbeats_per_beat    => subbeats_per_beat,
                   :confidence           => confidence }
    end
  end
  best = options.sort{ |x,y| x[:confidence] <=> y[:confidence] }.last
  [ infer_meter(ac, best[:subbeats_per_measure]), best[:confidence] ]
end

beatModel = Predictor.new
measModel = Predictor.new

$meter_vectors.each do |song_name, vector|
  next if vector[:note_queue].any?{ |x| x.is_a? MusicIR::Rest }

  puts "#############################################################################################################################"
  puts song_name
  
  expected_meter = vector[:meter]
  puts "expected meter: #{expected_meter.beats_per_measure}/#{expected_meter.beat_unit} (#{expected_meter.subbeats_per_beat}x)"
  puts "M:        " + (" "*(6*expected_meter.subbeats_per_beat*expected_meter.beats_per_measure)) + "M"
  puts "B:        " + (" "*(6*expected_meter.subbeats_per_beat                                 )) + "B"

  nq = vector[:note_queue]
  accents = nq.to_phenomenal_accent_array
  ac = accents.autocorrelation(num_lags=25)
  detected_meter, confidence = detect_meter(ac)

  puts "AC:  " + ac.map{ |x| sprintf("%6.1f", x) }.join("")
  puts "          " + (" "*(6*detected_meter.subbeats_per_beat)) + "B"
  puts "          " + (" "*(6*detected_meter.subbeats_per_beat*detected_meter.beats_per_measure)) + "M"
  puts "          " + (" "*(6*(1+ac[1..-1].index_of_max))) + "^"

  puts "actual meter:   #{detected_meter.beats_per_measure}/#{detected_meter.beat_unit} (#{detected_meter.subbeats_per_beat}x)"
  puts "confidence: " + sprintf("%.2f", confidence)

  beatModel.observe!(detected_meter.subbeats_per_beat, expected_meter.subbeats_per_beat)
  measModel.observe!(detected_meter.beats_per_measure, expected_meter.beats_per_measure)
end

puts "#############################################################################################################################"
puts "beat: #{sprintf("%.1f", 100.0*beatModel.accuracy)}% accuracy"
puts "meas: #{sprintf("%.1f", 100.0*measModel.accuracy)}% accuracy"
