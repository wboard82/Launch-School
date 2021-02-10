class Robot
  @@names = []

  def name
    return @name if @name
    @name = random_name
    @@names << @name
    @name
  end

  def reset
    @@names.delete(@name)
    @name = nil
  end

  private

  def random_name
    new_name = nil
    loop do
      new_name = "#{random_chars(2)}#{random_nums(3)}"
      break unless @@names.include?(new_name)
    end

    new_name
  end

  def random_chars(num)
    result = ""
    num.times do
      result << rand('A'.ord..'Z'.ord).chr
    end
    result
  end

  def random_nums(num)
    result = ""
    num.times do
      result << rand(0..9).to_s
    end
    result
  end
end
