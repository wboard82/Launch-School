class AngryCat
  def initialize(age, name)
    @age  = age
    @name = name
  end

  def age
    puts @age
  end

  def name
    puts @name
  end

  def hiss
    puts "Hisssss!!!"
  end
end

lucifer = AngryCat.new(7, "Lucifer")
scarfield = AngryCat.new(5, "Scarfield")

