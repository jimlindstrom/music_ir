$scoring_lambdas = []

###########################################################################################################
boundary_strength__end_vs_max = lambda do |nq, start_idx, end_idx|
  pbc =  MusicIR::PhraseBoundaryClassifier.instance
  boundary_strengths = (start_idx..end_idx).map{ |note_idx| pbc.end_of_phrase_boundary_strength(nq, note_idx) }
  boundary_strengths[-1] / (boundary_strengths[0..-2].max + 1.0)
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
less_than_10_notes_lambda = lambda do |nq, start_idx, end_idx|
  ((end_idx-start_idx)<10) ? 1 : 0
end
less_than_5_notes_lambda = lambda do |nq, start_idx, end_idx|
  ((end_idx-start_idx)<5) ? 1 : 0
end

###########################################################################################################
random_lambda = lambda do |nq, start_idx, end_idx|
  score = rand
end

###########################################################################################################

$scoring_lambdas << {:name=>"boundary strength: end/max", :lambda=>boundary_strength__end_vs_max}

$scoring_lambdas << {:name=>"pitch range>10", :lambda=>pitch_range_more_than_10}
$scoring_lambdas << {:name=>"pitch range>5",  :lambda=>pitch_range_more_than_5}

$scoring_lambdas << {:name=>">20 notes", :lambda=>more_than_20_notes_lambda}
$scoring_lambdas << {:name=>">10 notes", :lambda=>more_than_10_notes_lambda}
$scoring_lambdas << {:name=>"<10 notes", :lambda=>less_than_10_notes_lambda}
$scoring_lambdas << {:name=>"<5 notes",  :lambda=>less_than_5_notes_lambda}

$scoring_lambdas << {:name=>"random (control)", :lambda=>random_lambda}
