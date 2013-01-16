require "bundler"

envs = [:default, :development]
envs << :debug if ENV["DEBUG"]
Bundler.setup(*envs)

$:.unshift(File.expand_path(File.join(File.dirname(__FILE__), "../lib")))
require "music_ir"

$:.unshift(File.expand_path(File.join(File.dirname(__FILE__), "vectors")))
require "meter_vectors"
require "qioi_vectors"

require "markov" # FIXME: do this here?

require 'rspec'

