
class Dog

  def method
    puts "Method"
  end

  def another_method
    puts "Another method"
  end

  private :method, :another_method
end
