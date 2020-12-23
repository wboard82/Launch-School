SKIP = 2

def funny_sum(row_number)
  sequence = create_sequence(row_number)
  sequence[row_number - 1].sum
end

def create_sequence(row_num)
  current_number = 2
  result = []
  outer_counter = 1
  
  while outer_counter <= row_num
    current_row = []
    inner_counter = outer_counter
    
    while inner_counter > 0
      current_row << current_number
      current_number += 2
      inner_counter -= 1
    end

    result << current_row
    outer_counter += 1
  end

  result
end

p funny_sum(1) == 2
p funny_sum(2) == 10
p funny_sum(3) == 30
