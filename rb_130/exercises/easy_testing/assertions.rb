#1 - Boolean
assert_equal(true, value.odd?, 'Value is not odd')

#2 - Equality
assert_equal('xyz', value.downcase)

#3 - Nil
assert_nil(value)

#4 - Empty
assert_empty(list)

#5 - Included
assert_includes(list, 'xyz')

#6 - Exceptions
assert_raises(NoExperienceError) { employee.hire }

#7 - Type
assert_instance_of(Numeric, value)

#8 - Kind
assert_kind_of(Numeric, value)

#9 - Same
assert_same(list, list.process)

#10 - Refute
refute_includes(list, 'xyz')
