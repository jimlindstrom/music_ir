#!/usr/bin/env ruby

require 'linear'

filename = ARGV[0]
rows=eval(File.read(filename))

labels  = rows.map{ |row| row[0]     }
x       = rows.map{ |row| row[1..-1] }
samples = x.map do |row| 
  sample = {}
  row.each_with_index do |val, idx| 
    if val
      sample[idx] = val
    end
  end
  sample
end

pa = LParameter.new
pa.solver_type = MCSVM_CS 
pa.eps = 0.1
problem = LProblem.new(labels, samples, 1.0)
model = LModel.new(problem, pa)

tp = 0
tn = 0
fp = 0
fn = 0
0.upto(labels.length-1) do |idx|
  predicted_label, scores = model.predict_values(samples[idx])
  puts "scores: " + scores.inspect
  if labels[idx]==1
    if predicted_label == 1
      tp += 1
    else
      fn += 1
    end
  else
    if predicted_label == 0
      tn += 1
    else
      fp += 1
    end
  end
end

puts "WARNING: still weighting class 1 by 2.9..."
puts "tp: #{tp}"
puts "tn: #{tn}"
puts "fp: #{fp}"
puts "fn: #{fn}"

precision   = tp / (tp + fp).to_f
recall      = tp / (tp + fn).to_f
specificity = tn / (tn + fp).to_f
accuracy    = (tp + tn) / (tp + tn + fp + fn).to_f

puts "precision   = #{sprintf "%6.4f%%", 100*precision} = tp / (tp + fp)"
puts "recall      = #{sprintf "%6.4f%%", 100*recall} = tp / (tp + fn)"
puts "specificity = #{sprintf "%6.4f%%", 100*specificity} = tn / (tn + fp)"
puts "accuracy    = #{sprintf "%6.4f%%", 100*accuracy} = (tp + tn) / (tp + tn + fp + fn)"


