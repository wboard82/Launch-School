#write a method that counts occurances of each element in a given array
#once counted print each element alongside the number of occurences
# - case sensitive

vehicles = [
  'car', 'Car', 'Truck', 'car', 'SUV', 'truck',
  'motorcycle', 'Motorcycle', 'car', 'truck'
]

def count_occurrences(arr)
  occurences = {}
  downcase_arr = arr.map {|w| w.downcase}
  downcase_arr.uniq.each do |item|
    occurences[item] = downcase_arr.count(item)
  end

  occurences.each do |key, val|
    puts "#{key} => #{val}"
  end
end


count_occurrences(vehicles)

