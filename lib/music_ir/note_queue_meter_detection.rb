#!/usr/bin/env ruby

# assumes it is included in NoteQueue
module CanDetectMeter

  def meter
    return @meter if @meter
    detect_meter!
    @meter
  end

private

  def detect_meter!
    @meter = detect_time_signature

    bsm = MusicIR::BeatSimilarityMatrix.new(self.to_beat_array)
    bsm_diags = (1..20).map{ |i| { :subbeat=>i, :score=>bsm.geometric_mean_of_diag(i) } }.sort{ |x,y| y[:score] <=> x[:score] }
    $log.info "\t\tbsm_diags: #{bsm_diags.inspect.gsub(/, {/, "\n\t\t            {")}" if $log

    initial_beat_position = detect_initial_beat_position(bsm)
    return false if !initial_beat_position

    set_beat_position_of_all_notes(initial_beat_position)

    return true
  end

  def detect_time_signature
    accents = self.to_phenomenal_accent_array
    ac = accents.autocorrelation($meter_autocorrel_lags)
  
    candidates = []
    MusicIR::Meter.each do |beats_per_measure, beat_unit, subbeats_per_beat|
      err = $meter_autocorrel_signature[beats_per_measure][subbeats_per_beat][beat_unit].zip(ac).each_with_index.map{ |x,i| (x[0]-x[1])**2 }.inject(:+)
      likelihood = 1.0 / err
      likelihood *= ($meter_prior_probability[beats_per_measure][subbeats_per_beat][beat_unit]**0.05)
      candidates << { :likelihood => likelihood,
                      :meter => MusicIR::Meter.new(beats_per_measure, beat_unit, subbeats_per_beat) }
    end
    best_candidate = candidates.sort{ |x,y| x[:likelihood] <=> y[:likelihood] }.last
    best_candidate[:meter]
  end
 
  def detect_initial_beat_position(bsm)
    $log.info "\ttrying to detect initial beat position:" if $log

    correl_len = @meter.subbeats_per_measure
    ba = self.to_beat_array
    correls = [0.0]*correl_len
    (0..(ba.length-1)).each do |i|
      if !(cur_beat = ba[i]).nil?
        if (cur_note = cur_beat.cur_note).class == MusicIR::Note
          correls[correl_len - 1 - ((correl_len -1 + i) % correl_len)] += cur_note.duration.val
        end
      end
    end
    correls = (0..(correls.length-1)).collect { |i| { :subbeat=>i, :score=>correls[i] } }.sort{ |x,y| y[:score]<=>x[:score] }
    $log.info "\t\tcorrels: #{correls.inspect.gsub(/, {/, "\n\t\t          {")}" if $log

    initial_subbeat = correls[0][:subbeat]
    confidence = correls[0][:score].to_f / correls[1][:score]

    if confidence < 1.5
      $log.info "\t\tConfidence (#{confidence}) about starting subbeat (#{initial_subbeat}) is too low" if $log
      initial_subbeat = 0
    end

    b = MusicIR::BeatPosition.new
    b.measure           = 0
    b.beats_per_measure = @meter.beats_per_measure
    b.subbeats_per_beat = @meter.subbeats_per_beat
    b.beat              = initial_subbeat / @meter.subbeats_per_beat
    b.subbeat           = initial_subbeat % @meter.subbeats_per_beat
    $log.info "\t\tinitial beat pos: #{b.inspect}" if $log

    return b
  end

  def set_beat_position_of_all_notes(initial_beat_position)
    beat_pos = initial_beat_position
    @notes.each do |n|
      n.analysis[:beat_position] = beat_pos.dup

      beat_pos.subbeat += n.duration.val
      while beat_pos.subbeat >= beat_pos.subbeats_per_beat
        beat_pos.beat    += 1
        beat_pos.subbeat -= beat_pos.subbeats_per_beat
      end
      while beat_pos.beat >= beat_pos.beats_per_measure
        beat_pos.measure += 1
        beat_pos.beat    -= beat_pos.beats_per_measure
      end
    end
  end

end

