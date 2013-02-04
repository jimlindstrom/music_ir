module MusicIR
  
  class Predictor
    def initialize
      @types_of_actual = []
      @types_of_expected = []
      @observations = { }
      @correct = 0
      @incorrect = 0
    end

    def observe!(actual, expected)
      @types_of_actual = (@types_of_actual + [actual]).uniq
      @types_of_expected = (@types_of_expected + [expected]).uniq
      @observations[expected] ||= { }
      @observations[expected][actual] ||= 0
      @observations[expected][actual] += 1
  
      if actual == expected
        @correct += 1
      else
        @incorrect += 1
      end
    end

    def accuracy
      @correct.to_f / (@correct + @incorrect)
    end

    def summary
      str = ""
      str += sprintf " |%9s%15s\n", " ", "actual --->"
      str += sprintf "%11s", "V expected"
      @types_of_actual.sort.each do |actual|
        str += sprintf "%11s", actual.to_s
      end
      str += "\n"
      @types_of_expected.sort.each do |expected|
        str += sprintf "%11s", expected.to_s
        @types_of_actual.sort.each do |actual|
          str += sprintf "%11s", sprintf("% 11d", @observations[expected][actual] || 0)
        end
        str += "\n"
      end
      str
    end
  end
  
end
