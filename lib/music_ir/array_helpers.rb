class Array
  def autocorrelation(num_lags)
    ac = []
    0.upto(num_lags-1) do |lag|
      sum = 0
      lag.upto(self.length-1) do |idx|
        sum += (self[idx-lag] * self[idx])
      end
      ac << sum
    end
    return ac.map{ |x| x/ac[0].to_f }
  end
end
