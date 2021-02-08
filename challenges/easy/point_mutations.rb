class DNA
  def initialize(string)
    @strand = string
  end

  def hamming_distance(string)
    diffs = 0

    @strand.each_char.with_index do |char, index|
      break if index >= string.size
      diffs += 1 if char != string[index]
    end

    diffs
  end

end
