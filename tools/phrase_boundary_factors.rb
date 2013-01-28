$scoring_lambdas = []

###########################################################################################################
is_different_from_prev_chord_lambda = lambda do |nq, idx|
  if ((idx-1) >= 0) && nq[idx-1].analysis[:chord] && nq[idx].analysis[:chord]
    score = (nq[idx-1].analysis[:chord].to_s == nq[idx].analysis[:chord].to_s) ? 1 : 0
  else
    score = nil # undefined
  end
  score
end

###########################################################################################################
is_different_from_next_chord_lambda = lambda do |nq, idx|
  if ((idx+1) < nq.length) && nq[idx+1].analysis[:chord] && nq[idx].analysis[:chord]
    score = (nq[idx+1].analysis[:chord].to_s == nq[idx].analysis[:chord].to_s) ? 1 : 0
  else
    score = nil # undefined
  end
  score
end

###########################################################################################################
is_next_tonic_chord_lambda = lambda do |nq, idx|
  if ((idx+1) < nq.length) && nq[idx+1].analysis[:key] && nq[idx+1].analysis[:chord]
    score = (nq[idx+1].analysis[:key].to_s == nq[idx+1].analysis[:chord].to_s) ? 1 : 0
  else
    score = nil # undefined
  end
  score
end

###########################################################################################################
is_tonic_chord_lambda = lambda do |nq, idx|
  if nq[idx].analysis[:key] && nq[idx].analysis[:chord]
    score = (nq[idx].analysis[:key].to_s == nq[idx].analysis[:chord].to_s) ? 1 : 0
  else
    score = nil # undefined
  end
  score
end

###########################################################################################################
is_subbeat0_lambda = lambda do |nq, idx|
  if nq[idx].analysis[:beat_position]
    score = (nq[idx].analysis[:beat_position].subbeat == 0) ? 1 : 0
  else
    score = nil # undefined
  end
  score
end

###########################################################################################################
is_end_of_measure_lambda = lambda do |nq, idx|
  if nq[idx].analysis[:beat_position] && ((idx+1) < nq.length)
    cur_note_meas  = nq[idx+0].analysis[:beat_position].measure
    next_note_meas = nq[idx+1].analysis[:beat_position].measure
    score = (next_note_meas > cur_note_meas) ? 1 : 0
  else
    score = nil # undefined
  end
  score
end

###########################################################################################################
next_dur_ratio_lambda = lambda do |nq, idx|
  if (idx+1) < nq.length
    score = nq[idx+0].duration.val.to_f / nq[idx+1].duration.val
  else
    score = nil # undefined
  end
  score
end

###########################################################################################################
prev_dur_ratio_lambda = lambda do |nq, idx|
  if idx >= 1
    score = nq[idx+0].duration.val.to_f / nq[idx-1].duration.val
  else
    score = nil # undefined
  end
  score
end

###########################################################################################################
next_is_repeated_pitch_lambda = lambda do |nq, idx|
  if (idx+1) < nq.length
    score = (nq[idx+1].pitch.val == nq[idx+0].pitch.val) ? 1 : 0
  else
    score = nil # undefined
  end
  score
end

###########################################################################################################
is_repeated_pitch_lambda = lambda do |nq, idx|
  if (idx-1) >= 0
    score = (nq[idx-1].pitch.val == nq[idx+0].pitch.val) ? 1 : 0
  else
    score = nil # undefined
  end
  score
end

###########################################################################################################
next_interval_lambda = lambda do |nq, idx|
  if (idx+1) < nq.length
    score = (nq[idx+1].pitch.val - nq[idx+0].pitch.val).abs
  else
    score = nil # undefined
  end
  score
end

###########################################################################################################
before_abs_interval_to_after_abs_interval = lambda do |nq, idx|
  if ((idx-1) >= 0) && ((idx+1) < nq.length)
    interval_before = (nq[idx+0].pitch.val - nq[idx-1].pitch.val).abs
    interval_after  = (nq[idx+1].pitch.val - nq[idx+0].pitch.val).abs
    score = (interval_before+1.0) / (interval_after+1.0)
  else
    score = nil # undefined
  end
  score
end

###########################################################################################################
before_abs_interval_to_prev_abs_interval = lambda do |nq, idx|
  if (idx-2) >= 0
    interval_before = (nq[idx+0].pitch.val - nq[idx-1].pitch.val).abs
    interval_prev   = (nq[idx-1].pitch.val - nq[idx-2].pitch.val).abs
    score = (interval_before+1.0) / (interval_prev+1.0)
  else
    score = nil # undefined
  end
  score
end

###########################################################################################################
before_interval_to_prev_interval = lambda do |nq, idx|
  if (idx-2) >= 0
    interval_before = (nq[idx+0].pitch.val - nq[idx-1].pitch.val)
    interval_prev   = (nq[idx-1].pitch.val - nq[idx-2].pitch.val)
    if interval_prev==0
      score = nil
    else
      score = (interval_before) / (interval_prev)
    end
  else
    score = nil # undefined
  end
  score
end

###########################################################################################################
random_lambda = lambda do |nq, idx|
  score = rand
end

###########################################################################################################

$scoring_lambdas << {:name=>"cur dur/prev dur", :lambda=>prev_dur_ratio_lambda}
$scoring_lambdas << {:name=>"cur dur/next dur", :lambda=>next_dur_ratio_lambda}
$scoring_lambdas << {:name=>"is end of measure", :lambda=>is_end_of_measure_lambda}
$scoring_lambdas << {:name=>"is subbeat 0", :lambda=>is_subbeat0_lambda}
$scoring_lambdas << {:name=>"is different from next chord", :lambda=>is_different_from_next_chord_lambda}
$scoring_lambdas << {:name=>"next interval", :lambda=>next_interval_lambda}
$scoring_lambdas << {:name=>"repeated pitch", :lambda=>is_repeated_pitch_lambda}
$scoring_lambdas << {:name=>"is next tonic chord", :lambda=>is_next_tonic_chord_lambda}
$scoring_lambdas << {:name=>"before abs interval/after abs interval", :lambda=>before_abs_interval_to_after_abs_interval}
$scoring_lambdas << {:name=>"next repeated pitch", :lambda=>next_is_repeated_pitch_lambda}

#$scoring_lambdas << {:name=>"random (control)", :lambda=>random_lambda}
#
#$scoring_lambdas << {:name=>"before abs interval/prev abs interval", :lambda=>before_abs_interval_to_prev_abs_interval}
#$scoring_lambdas << {:name=>"before interval/prev interval", :lambda=>before_interval_to_prev_interval}
#$scoring_lambdas << {:name=>"is tonic chord", :lambda=>is_tonic_chord_lambda}
#$scoring_lambdas << {:name=>"is different from prev chord", :lambda=>is_different_from_prev_chord_lambda}


