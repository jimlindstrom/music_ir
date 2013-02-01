#!/usr/bin/env ruby

require 'music_ir'

$LOAD_PATH << 'spec/vectors'
require 'meter_vectors'

$phrasing_vectors.each do |song_name, vector|
  nq = vector[:note_queue]
  if nq.none?{ |note| note.is_a? MusicIR::Rest }
    nq.analyze_harmony!
    nq.detect_meter

    beat_array = nq.beat_array
    bsm = MusicIR::BeatCrossSimilarityMatrix.new(beat_array, beat_array)

    bsm.print_to_html("/tmp/" + song_name.gsub(/[^A-Za-z]/, '_') + ".html")
  end
end

