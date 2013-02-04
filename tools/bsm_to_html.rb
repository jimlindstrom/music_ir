#!/usr/bin/env ruby

require 'music_ir'

$LOAD_PATH << 'spec/vectors'
require 'meter_vectors'

$phrasing_vectors.each do |song_name, vector|
  nq = vector[:note_queue]
  if nq.none?{ |note| note.is_a? MusicIR::Rest }
    nq.meter
    nq.analyze_harmony!

    beat_array = nq.to_beat_array
    bsm = MusicIR::BeatCrossSimilarityMatrix.new(beat_array, beat_array)

    filename = "/tmp/" + song_name.gsub(/[^A-Za-z]/, '_') + ".html"
    f = File.open(filename, "w")

    f.puts "<html>"
    f.puts "<head>"
    f.puts "<style>"
    f.puts "table.grid { cellspacing: 0; cellpadding: 0; border: none; }"
    f.puts "table.grid tr { cellspacing: 0; cellpadding: 0; border: none; }"
    f.puts "table.grid td { border: none; width: 4px; height: 4px; }"
    f.puts "</style>"
    f.puts "</head>"
    f.puts "<body>"

    f.puts "Color palette (0.0 to 1.0):<br />"
    f.puts "<table class=\"grid\"><tr>"
    0.upto(100) do |x|
      v = x/100.0

      r = [[((v*3.0) - 0.0), 0.0].max, 1.0].min
      g = [[((v*3.0) - 1.0), 0.0].max, 1.0].min
      b = [[((v*3.0) - 2.0), 0.0].max, 1.0].min
      color_str = ("%02x" % (255.0*r).floor) + ("%02x" % (255.0*g).floor) + ("%02x" % (255.0*b).floor)
      f.print "<td bgcolor=\"##{color_str}\"></td>"
  
    end
    f.puts "</tr></table><br />"

    bsm.print_to_html(f)

    f.puts "</body></html>"
    f.close
  end
end

