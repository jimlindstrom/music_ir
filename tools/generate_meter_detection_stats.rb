#!/usr/bin/env ruby

require 'music_ir'

$LOAD_PATH << 'spec/vectors'
require 'meter_vectors'
require 'meter_vectors2'

$new_meter_autocorrel_lags = 25
$new_meter_autocorrel_signature = { }
$new_meter_prior_probability = { }

def detect_meter__signature(note_queue)
  accents = note_queue.to_phenomenal_accent_array
  ac = accents.autocorrelation($new_meter_autocorrel_lags)

  candidates = []
  MusicIR::Meter.each do |beats_per_measure, beat_unit, subbeats_per_beat|
    err = $new_meter_autocorrel_signature[beats_per_measure][subbeats_per_beat][beat_unit].zip(ac).each_with_index.map{ |x,i| (x[0]-x[1])**2 }.inject(:+)
    likelihood = 1.0 / err
    likelihood *= ($new_meter_prior_probability[beats_per_measure][subbeats_per_beat][beat_unit]**0.05)
    candidates << { :likelihood => likelihood, 
                    :meter => MusicIR::Meter.new(beats_per_measure, beat_unit, subbeats_per_beat) }
  end
  best_candidate = candidates.sort{ |x,y| x[:likelihood] <=> y[:likelihood] }.last
  best_candidate[:meter]
end

def generate_meter_prediction_stats(vectors)
  MusicIR::Meter.each do |beats_per_measure, beat_unit, subbeats_per_beat|
    $new_meter_autocorrel_signature[beats_per_measure] ||= { }
    $new_meter_prior_probability[beats_per_measure]     ||= { }
  
    $new_meter_autocorrel_signature[beats_per_measure][subbeats_per_beat] ||= { }
    $new_meter_prior_probability[beats_per_measure][subbeats_per_beat]      ||= { }
  
    $new_meter_autocorrel_signature[beats_per_measure][subbeats_per_beat][beat_unit] = [[]]*$new_meter_autocorrel_lags
    $new_meter_prior_probability[beats_per_measure][subbeats_per_beat][beat_unit] = 0
  end
  
  sum_of_priors = 0
  vectors.each do |song_name, vector|
    note_queue     = vector[:note_queue]
    expected_meter = vector[:expected_meter]
  
    accents = note_queue.to_phenomenal_accent_array
    ac = accents.autocorrelation($new_meter_autocorrel_lags)
  
    $new_meter_prior_probability[expected_meter.beats_per_measure][expected_meter.subbeats_per_beat][expected_meter.beat_unit] += 1
    sum_of_priors += 1
    ac.each_with_index do |x,i|
      $new_meter_autocorrel_signature[expected_meter.beats_per_measure][expected_meter.subbeats_per_beat][expected_meter.beat_unit][i] << x
    end
  end
  
  MusicIR::Meter.each do |beats_per_measure, beat_unit, subbeats_per_beat|
    $new_meter_autocorrel_signature[beats_per_measure][subbeats_per_beat][beat_unit].map!{ |x| (x.empty?) ? -1.0 : (x.inject(:+).to_f / x.length) }
    $new_meter_prior_probability[beats_per_measure][subbeats_per_beat][beat_unit] /= sum_of_priors.to_f
  end
end

def valid_meter_vectors
  valid_vectors = { }

  note_queue = nil
  $meter_vectors2.each do |song_name, vector|
    begin
      note_queue = MusicIR::NoteQueue.from_event_queue(MusicIR::EventQueue.new(vector[:events]))
    rescue
      note_queue = nil
    end
  
    if !note_queue
      STDERR.puts "SKIPPING \"#{song_name}\": couldn't convert from event queue to note queue"
      next
    elsif !MusicIR::Meter::ALLOWED_BEATS_PER_MEASURE.include?(vector[:time_sig_numerator])
      STDERR.puts "SKIPPING \"#{song_name}\": has non-allowed beats/meas: #{vector[:time_sig_numerator]}"
      next
    elsif !MusicIR::Meter::ALLOWED_BEAT_UNITS.include?(vector[:time_sig_denominator])
      STDERR.puts "SKIPPING \"#{song_name}\": has non-allowed beat unit: #{vector[:time_sig_denominator]}"
      next
    elsif ![24, 48, 96, 256, 512, 1024].include?(note_queue.tempo.round)
      STDERR.puts "SKIPPING \"#{song_name}\": has unusual note_queue.tempo: #{note_queue.tempo}"
      next
    end
  
    expected_subbeats_per_beat = case note_queue.tempo.round
      # Bach chorales
      when  256 then 4
      when  512 then 2
      when 1024 then 1
      # Misc songs
      when   24 then 4
      when   48 then 2
      when   96 then 1
    end

    valid_vectors[song_name] = vector
    valid_vectors[song_name][:note_queue]     = note_queue
    valid_vectors[song_name][:expected_meter] = MusicIR::Meter.new(vector[:time_sig_numerator], vector[:time_sig_denominator], expected_subbeats_per_beat)
  end

  STDERR.puts "there are #{$meter_vectors2.keys.length} vectors"
  STDERR.puts "we're using #{valid_vectors.length} of them"

  valid_vectors
end

def split_vectors(vectors)
  shuffled = vectors.to_a.shuffle

  num_training_vectors = (shuffled.length*0.75).round

  training_vectors = shuffled[0..(num_training_vectors-1)]
  test_vectors     = shuffled[num_training_vectors..-1]
  return [ Hash[training_vectors], Hash[test_vectors] ]
end

def characterize_meter_prediction(vectors)
  newModel     = MusicIR::Predictor.new
  oldModel     = MusicIR::Predictor.new
  
  vectors.each do |song_name, vector|
    note_queue     = vector[:note_queue]
    expected_meter = vector[:expected_meter]
  
    detected_meter = detect_meter__signature(note_queue)
  
    newModel.observe!(detected_meter.to_s, expected_meter.to_s)
    oldModel.observe!(note_queue.meter ? note_queue.meter.to_s : "", expected_meter.to_s)
  end
  
  return [ newModel, oldModel ]
end

training_vectors, test_vectors = split_vectors(valid_meter_vectors)

generate_meter_prediction_stats(training_vectors)
newModel, oldModel = characterize_meter_prediction(training_vectors)

STDERR.puts "old:"
STDERR.puts oldModel.summary
STDERR.puts "#{sprintf("%.1f", 100.0*oldModel.accuracy)}% accuracy"
STDERR.puts
  
STDERR.puts "new:"
STDERR.puts newModel.summary
STDERR.puts "#{sprintf("%.1f", 100.0*newModel.accuracy)}% accuracy"

puts "$meter_autocorrel_lags = #{$new_meter_autocorrel_lags.inspect}"
puts "$meter_autocorrel_signature = #{$new_meter_autocorrel_signature.inspect}"
puts "$meter_prior_probability = #{$new_meter_prior_probability.inspect}"


