class Student
  attr_accessor :name
  attr_writer :grade

  def initialize(name, grade)
    @name = name
    @grade = grade
  end

  def better_grade_than?(other)
    self.grade > other.grade
  end

  protected

  def grade
    @grade
  end

    
end
