#!/usr/bin/env ruby

def normalize_weights(weights)
  weights.map{ |x| x / weights.inject(:+) }
end
def random_p_weights
  normalize_weights([rand, rand, rand, rand, rand])
end
def random_n_weights
  normalize_weights([rand, rand])
end
def write_weights(p_weights, n_weights)
  f = File.open("lib/music_ir/note_similarity_weights.rb", "w")
  f.puts "$pitch_similarity_weights = " + p_weights.inspect
  f.puts "$note_similarity_weights  = " + n_weights.inspect
  f.close
end
def run_specs
  system("rm /tmp/spec_out.txt")
  system("/Users/jimlindstrom/.rvm/rubies/ruby-1.9.3-p194/bin/ruby -S rspec spec/note_queue_meter_detection_spec.rb > /tmp/spec_out.txt 2>&1")
end
def read_performance
  `cat /tmp/spec_out.txt | grep "got: " | sed -e "s/[^0-9.]//g"`.to_f
end

POP_SIZE=10
population = (1..POP_SIZE).map{ { :p_weights=>random_p_weights, :n_weights=>random_n_weights, :score=>nil } }
(0..(POP_SIZE-1)).each do |i|
  write_weights(population[i][:p_weights], population[i][:n_weights])
  run_specs
  population[i][:score] = read_performance
end
population.sort!{ |x,y| x[:score] <=> y[:score] }
puts population.inspect
