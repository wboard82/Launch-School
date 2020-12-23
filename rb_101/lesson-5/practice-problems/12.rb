# Write code that will convert this to a hash where the first element of each sub-array
# is the key and the second is the value. Do not use to_h


arr = [[:a, 1], ['b', 'two'], ['sea', {c: 3}], [{a: 1, b: 2, c: 3, d: 4}, 'D']]
# expected return value: {:a=>1, "b"=>"two", "sea"=>{:c=>3}, {:a=>1, :b=>2, :c=>3, :d=>4}=>"D"}

hsh = {}
arr.each do |sub_arr|
  hsh[sub_arr[0]] = sub_arr[1]
end

p arr
p hsh
