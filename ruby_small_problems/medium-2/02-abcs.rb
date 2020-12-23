# - Collection of blocks with a letter on each side
# - Word can be spelled if it does not use both letters from one block
# - Each block can be used only once
# - Case insensitive
# - INPUT: String (a word)
# - OUTPUT: boolean (true if that word can be spelled using given blocks)
# - DATA: Nested array ([['B', 'A'], ['X', 'K'], etc...])
# - ALGORITHM:
#   - Split the given word into characters
#   - For each character search for the character in BLOCKS
#     - If found, remove that subarray from BLOCKS
#     - If not found, return false
#   - If loop exits, return true


def block_word?(word)
  blocks = [['B', 'O'], ['X','K'], ['D','Q'], ['C','P'], ['N','A'], ['G','T'],
            ['R','E'], ['F','S'], ['J','W'], ['H','U'], ['V','I'], ['L','Y'], ['Z','M']]
  word.each_char do |char|
    block = blocks.assoc(char.upcase) || blocks.rassoc(char.upcase)
    if block
      blocks.delete(block)
    else
      return false
    end
  end

  true
end

p block_word?('BATCH') == true
p block_word?('BUTCH') == false
p block_word?('jest') == true
p block_word?('HI')
p block_word?('CAT')
p block_word?('TRUCK')
p block_word?('TAXI')
p block_word?('OCEAN')
