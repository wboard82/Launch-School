def buy_fruit1(list)
  final_list = []
  list.each do |pair|
    pair.last.times { final_list << pair.first }
  end
  final_list
end

def buy_fruit(list)
  list.map { |pair| [pair.first] * pair.last }.flatten
end

p buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
  ["apples", "apples", "apples", "orange", "bananas","bananas"]
