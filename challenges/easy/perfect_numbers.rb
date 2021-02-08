class PerfectNumber
  def self.classify(num)
    raise(StandardError, "Numbers must be positive") if num < 0
    case sum_of_factors(num)
    when num then 'perfect'
    when (0...num) then 'deficient'
    else 'abundant'
    end
  end

  class << self
    private
    def sum_of_factors(num)
      factors(num).sum
    end

    def factors(num)
      factors = [1]

      2.upto(Integer.sqrt(num)) do |divisor|
        dividend, remainder = num.divmod(divisor)
        factors.concat([divisor, dividend]) if remainder == 0
      end

      factors.uniq
    end
  end
end
