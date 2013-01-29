$scoring_lambdas = []

###########################################################################################################
boundary_strength__end = lambda do |nq, start_idx, end_idx|
  pbc =  MusicIR::PhraseBoundaryClassifier.instance
  pbc.end_of_phrase_boundary_strength(nq, end_idx)
end
boundary_strength__end_vs_max = lambda do |nq, start_idx, end_idx|
  return nil if start_idx==end_idx
  pbc =  MusicIR::PhraseBoundaryClassifier.instance
  boundary_strengths = (start_idx..end_idx).map{ |note_idx| pbc.end_of_phrase_boundary_strength(nq, note_idx) }
  boundary_strengths[-1] / (boundary_strengths[0..-2].max + 1.0)
end
boundary_strength__max_vs_min = lambda do |nq, start_idx, end_idx|
  return nil if start_idx==end_idx
  pbc =  MusicIR::PhraseBoundaryClassifier.instance
  boundary_strengths = (start_idx..end_idx).map{ |note_idx| pbc.end_of_phrase_boundary_strength(nq, note_idx) }
  boundary_strengths.max / (boundary_strengths.min + 1.0)
end

###########################################################################################################
last_two_durations_ratio = lambda do |nq, start_idx, end_idx|
  return nil if ((end_idx-start_idx)<1)
  last_duration = nq[end_idx-0].duration.val
  prev_duration = nq[end_idx-1].duration.val
  prev_duration.to_f / (1.0 + last_duration)
end

###########################################################################################################
abs_interval_sum = lambda do |nq, start_idx, end_idx|
  return nil if start_idx==end_idx
  nq[start_idx..end_idx].each_cons(2).map{ |notes| (notes[1].pitch.val - notes[0].pitch.val).abs }.inject(:+)
end
interval_sqrd_sum = lambda do |nq, start_idx, end_idx|
  return nil if start_idx==end_idx
  nq[start_idx..end_idx].each_cons(2).map{ |notes| (notes[1].pitch.val - notes[0].pitch.val)**2 }.inject(:+)
end
mean_abs_interval = lambda do |nq, start_idx, end_idx|
  return nil if start_idx==end_idx
  abs_intervals = nq[start_idx..end_idx].each_cons(2).map{ |notes| (notes[1].pitch.val - notes[0].pitch.val).abs }
  abs_intervals.inject(:+).to_f / abs_intervals.length
end
last_two_intervals_ratio = lambda do |nq, start_idx, end_idx|
  return nil if ((end_idx-start_idx)<2)
  last_interval = (nq[end_idx-0].pitch.val - nq[end_idx-1].pitch.val).abs
  prev_interval = (nq[end_idx-1].pitch.val - nq[end_idx-2].pitch.val).abs
  prev_interval.to_f / (1.0 + last_interval)
end

###########################################################################################################
pitch_range_more_than_10 = lambda do |nq, start_idx, end_idx|
  pitch_vals = nq[start_idx..end_idx].map{ |note| note.pitch.val }
  ((pitch_vals.max - pitch_vals.min)>10) ? 1 : 0
end
pitch_range_more_than_5 = lambda do |nq, start_idx, end_idx|
  pitch_vals = nq[start_idx..end_idx].map{ |note| note.pitch.val }
  ((pitch_vals.max - pitch_vals.min)>5) ? 1 : 0
end

###########################################################################################################
more_than_20_notes_lambda = lambda do |nq, start_idx, end_idx|
  ((end_idx-start_idx)>20) ? 1 : 0
end
more_than_10_notes_lambda = lambda do |nq, start_idx, end_idx|
  ((end_idx-start_idx)>10) ? 1 : 0
end
more_than_5_notes_lambda = lambda do |nq, start_idx, end_idx|
  ((end_idx-start_idx)>5) ? 1 : 0
end

###########################################################################################################
random_lambda = lambda do |nq, start_idx, end_idx|
  score = rand
end

###########################################################################################################


$scoring_lambdas << {:name=>"boundary strength: end", :lambda=>boundary_strength__end}
$scoring_lambdas << {:name=>">10 notes", :lambda=>more_than_10_notes_lambda}
$scoring_lambdas << {:name=>"last two durations ratio",  :lambda=>last_two_durations_ratio}
$scoring_lambdas << {:name=>"last two intervals ratio",  :lambda=>last_two_intervals_ratio}
$scoring_lambdas << {:name=>"pitch range>5",  :lambda=>pitch_range_more_than_5}
$scoring_lambdas << {:name=>">5 notes",  :lambda=>more_than_5_notes_lambda}
$scoring_lambdas << {:name=>">20 notes", :lambda=>more_than_20_notes_lambda}
$scoring_lambdas << {:name=>"abs interval sum",  :lambda=>abs_interval_sum}

#$scoring_lambdas << {:name=>"boundary strength: end/max", :lambda=>boundary_strength__end_vs_max}
#$scoring_lambdas << {:name=>"boundary strength: max/min", :lambda=>boundary_strength__max_vs_min}
#
#$scoring_lambdas << {:name=>"pitch range>10", :lambda=>pitch_range_more_than_10}
#
#$scoring_lambdas << {:name=>"interval sqrd sum",  :lambda=>interval_sqrd_sum}
#$scoring_lambdas << {:name=>"mean interval sum",  :lambda=>mean_abs_interval}

#$scoring_lambdas << {:name=>"random (control)", :lambda=>random_lambda}
