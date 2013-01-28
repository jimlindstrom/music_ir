$LOAD_PATH.unshift File.expand_path(File.dirname(__FILE__))
$LOAD_PATH.unshift File.expand_path("#{File.dirname(__FILE__)}/lib")

require "bundler"
Bundler::GemHelper.install_tasks

require 'rspec'
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec) do |t|
  t.pattern = 'spec/*_spec.rb'
end

desc "Regenerate the parameters for the hidden markov model in the key estimator"
task :regenerate_key_estimator do
  sh "./tools/create_hmm_matrices_for_key_estimation.rb tools/chord_stats/pop_genre__chord_stats.txt > lib/key_estimator_chord_stats.rb"
end

desc "Regenerate the parameters for the linear classifier for phrase boundary detection"
task :regenerate_phrase_boundary_classifier do
  sh "./tools/generate_phrase_boundary_classifier_matrix.rb > tools/phrases/boundary_classifier_matrix.txt"
  sh "./tools/characterize_phrase_boundary_classifier.rb tools/phrases/boundary_classifier_matrix.txt"
end

task :default => :spec
