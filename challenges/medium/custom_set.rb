class CustomSet
  def initialize(arr = [])
    @set = arr.uniq
  end

  def empty?
    @set.empty?
  end

  def contains?(elem)
    @set.include?(elem)
  end

  def subset?(other)
    @set.all? { |elem| other.set.include?(elem) }
  end

  def disjoint?(other)
    @set.none? { |elem| other.set.include?(elem) }
  end

  def eql?(other)
    return false unless @set.size == other.set.size
    subset?(other)
  end

  def add(elem)
    @set << elem unless @set.include?(elem)
    self
  end

  def ==(other)
    eql? other
  end

  def intersection(other)
    new_set = @set.select { |elem| other.contains?(elem) }
    CustomSet.new(new_set)
  end

  def difference(other)
    new_set = @set.reject { |elem| other.contains?(elem) }
    CustomSet.new(new_set)
  end

  def union(other)
    other.set.each { |elem| add(elem) }
    self
  end


  protected

  attr_reader :set
end

