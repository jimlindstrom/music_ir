#!/usr/bin/env ruby

module MusicIR
  
  class BeatCrossSimilarityMatrix
    attr_reader :width
    attr_reader :val #2d array of [0..(width-1)][0..(1st index)]

    def initialize(beat_array1, beat_array2)
      if beat_array1.length < beat_array2.length
        beat_array1 += [nil] * (beat_array2.length - beat_array1.length)
      end
      if beat_array2.length < beat_array1.length
        beat_array2 += [nil] * (beat_array1.length - beat_array2.length)
      end

      @width = beat_array1.size
      @val = []
      (0..(beat_array1.size-1)).each do |x|
        @val[x] = []
        (0..x).each do |y|
          if !beat_array1[x] && !beat_array2[y] && (y>0) && (x>0)
            @val[x][y] = 0.6*@val[x-1][y-1]
          elsif !beat_array1[x]
            @val[x][y] = 0.0
          else
            @val[x][y] = beat_array1[x].similarity_to beat_array2[y] 
          end
        end
      end
    end

    def arithmetic_mean_of_diag(i, penalize_overhanging_notes=true)
      x = i
      y = 0
      sum = 0.0
      count = 0
      while x < @width
        sum += @val[x][y]
        x += 1
        y += 1
        count += 1
      end

      return (sum-i) / @width.to_f if penalize_overhanging_notes
     
      return sum / count.to_f
    end

    def geometric_mean_of_diag(i)
      x = i
      y = 0
      prod = 1.0
      while x < @width
        prod = prod * (1.0 + @val[x][y])
        x += 1
        y += 1
      end
      return prod / 1.0**(@width-i)
    end

    def max_arithmetic_mean_of_diag(penalize_overhanging_notes=true)
      means = (0..(@width-1)).map{ |i| arithmetic_mean_of_diag(i, penalize_overhanging_notes) }
      return means.max
    end

    def max_geometric_mean_of_diag
      means = (0..(@width-1)).map{ |i| geometric_mean_of_diag(i) }
      return means.max
    end

    def print
      puts "\tmatrix:"
      (0..(@width-1)).each do |x|
        row = []
        (0..(@width-1)).each do |y|
          row.push sprintf("%4.2f", @val[x][y] || 0.0) # FIXME: is it a bug that this can contain nil?
        end
        puts "\t\t" + row.join(", ")
      end

      puts "\tarithmetic means:"
      means = (0..(@width-1)).map{ |i| arithmetic_mean_of_diag(i) }
      puts "\t\t" + means.map{ |x| sprintf("%5.3f", x) }.join(", ")
    end

    def print_to_html(filename)
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
      f.puts "<table class=\"grid\">"
      (0..(@width-1)).each do |x|
        f.puts "<tr>"
        (0..(@width-1)).each do |y|
          color_str = "000000"
          if @val[x][y]
            c = (255*@val[x][y]).floor
            color_str = c.to_s(16) + (0.75*c).floor.to_s(16) + (0.50*c).floor.to_s(16)
          end
          f.print "<td bgcolor=\"##{color_str}\"></td>"
        end
        f.print "</tr>"
      end
      f.puts "</table>"

      f.puts "<br/>"
      f.puts "<br/>"
      f.puts "arithmetic means:"
      f.puts "<table>"
      means = (0..(@width-1)).map{ |i| arithmetic_mean_of_diag(i) }
      f.puts means.each_with_index.map{ |x,i| sprintf("<tr><td>%d</td><td>%5.3f</td></tr>", i, x) }.join("\n")
      f.puts "<table>"

      f.puts "</body></html>"
      f.close
    end

  end

end
