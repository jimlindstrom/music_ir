require 'yaml'

music_ir_files = ['beat.rb',
                  'beat_cross_similarity_matrix.rb',
                  'beat_position.rb',
                  'beat_similarity_matrix.rb',
                  'clock.rb',
                  'distance_interval.rb',
                  'duration.rb',
                  'duration_and_beat_position.rb',
                  'event.rb',
                  'event_queue.rb',
                  'in_port.rb',
                  'interval.rb',
                  'ioi_array.rb',
                  'loopback.rb',
                  'meter.rb',
                  'midi_event.rb',
                  'note.rb',
                  'note_queue_meter_detection.rb',
                  'note_queue_phrase_detection.rb',
                  'note_queue.rb',
                  'out_port.rb',
                  'phrase.rb',
                  'phrase_list.rb',
                  'pitch.rb',
                  'pitch_class.rb',
                  'pitch_class_set.rb',
                  'rest.rb',
                  'version.rb',
                  'weighted_pitch_class_set.rb']

music_ir_files.each do |file|
  require File.join('music_ir', file)
end

