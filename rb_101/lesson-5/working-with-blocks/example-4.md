```
my_arr = [[18, 7], [3, 12]].each do |arr|
  arr.each do |num|
    if num > 5
      puts num
    end
  end
end
```

Line | Action                 | Object             | Side Effect               | Return Value          |  Is Return Used?           |
-----|------------------------|--------------------|---------------------------|-----------------------|----------------------------|
1    | method call to each    | outer array        | none                      | the calling element: the outer array | assigned to `my_arr`       |
1    | assignment to `my_arr` | n/a                |                           | the outer array       | no                         |
1-7  | block execution        | each sub-array     | none                      | original sub-array    | no                         | 
2    | method call to each    | each sub-array     | none                      | each sub-array        | yes, by the outer block to pass on as its return value |
2-6  | block execution        | each element in each sub-array | none          | nil                   | no                         |
3    | greater than comparison | each value and 5  | none                      | boolean               | yes, by if statement       |
3-5  | conditional           | boolean passed by < | none                      | nil (either way)      | yes, determines return value of block which itself is not used |
4    | method call to puts   | each value from sub-array | displays string rep of integer | nil        | yes, determines return value of if (when executed)


