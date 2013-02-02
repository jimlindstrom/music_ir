require 'markov'
require 'narray'
require 'hmm'
require 'linear'

music_ir_files = ['beat.rb',
                  'beat_cross_similarity_matrix.rb',
                  'beat_position.rb',
                  'beat_similarity_matrix.rb',
                  'distance_interval.rb',
                  'duration.rb',
                  'duration_and_beat_position.rb',
                  'event.rb',
                  'event_queue.rb',
                  'interval.rb',
                  'ioi_array.rb',
                  'loopback.rb',
                  'meter.rb',
                  'midi_event.rb',
                  'note_similarity_weights.rb',
                  'note.rb',
                  'pitch.rb',
                  'pitch_class.rb',
                  'pitch_class_set.rb',
                  'chord.rb',
                  'key_estimator_chord_stats.rb',
                  'note_queue_key_detection.rb',
                  'note_queue_meter_detection.rb',
                  'phrase_boundary_classifier.rb',
                  'note_queue_phrase_detection.rb',
                  'note_queue.rb',
                  'phrase.rb',
                  'phrase_list.rb',
                  'rest.rb',
                  'version.rb',
                  'weighted_pitch_class_set.rb']

music_ir_files.each do |file|
  require File.join('music_ir', file)
end

