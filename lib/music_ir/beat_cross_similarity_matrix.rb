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

    def print_to_html(f)
      f.puts "Beat Similarity Matrix:<br />"
      f.puts "<table class=\"grid\">"
      (0..(@width-1)).each do |x|
        f.puts "<tr>"
        (0..(@width-1)).each do |y|
          color_str = "000000"
          if @val[x][y]

            r = [[((@val[x][y]*3.0) - 0.0), 0.0].max, 1.0].min
            g = [[((@val[x][y]*3.0) - 1.0), 0.0].max, 1.0].min
            b = [[((@val[x][y]*3.0) - 2.0), 0.0].max, 1.0].min

            color_str = ("%02x" % (255.0*r).floor) + ("%02x" % (255.0*g).floor) + ("%02x" % (255.0*b).floor)
          end
          f.print "<td bgcolor=\"##{color_str}\"></td>"
        end
        f.print "</tr>"
      end
      f.puts "</table>"

      f.puts "<br/>"
      f.puts "<br/>"
      f.puts "Arithmetic means:"
      f.puts "<table>"
      f.puts "<tr>"
      f.puts "<td style=\"width:  50px;\">Diag</td>"
      f.puts "<td style=\"width:  80px; text-align: right;\">Ari. Mean</td>"
      f.puts "<td style=\"width: 100px; text-align: right;\">Geo. Mean</td>"
      f.puts "</tr>"
      0.upto(@width-1) do |diag|
        f.puts "<tr>"
        f.puts "<td>#{diag}</td>"
        f.puts "<td style=\"width:  80px; text-align: right;\">#{sprintf("%+.4f", arithmetic_mean_of_diag(diag))}</td>"
        f.puts "<td style=\"width: 100px; text-align: right;\">#{sprintf("%.2e",  geometric_mean_of_diag( diag))}</td>"
        f.puts "</tr>"
      end
      f.puts "</table>"
    end

  end

end
