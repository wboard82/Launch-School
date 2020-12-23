=begin
1. what is != and where should you use it?
!= is the not equal operator. It should be used to evaluate whether two expressions are not equal.

2. put ! before something, like !user_name
! is the negation operator. It will negate the truthiness of whatever is after it.
If it preceeds false or nil it will return true. Otherwise it will return false.

3. put ! after something, like words.uniq!
This does not have a syntactical meaning. However, convention is that methods
that end with ! will mutate the caller.

4. put ? before something
This does nothing and will probably be a syntax error unless it is part of the
ternary operator. The ternary operator: b1 ? e1 : e2 will evaluate b1 to a boolean
value, then evaluate to e1 if b1 is true, e2 if false.

5. put ? after something
If it is put at the end of a method, this denotes a predicate, or method that
returns true/false. This is another naming convention, not a syntax rule.

6. put !! before something, like !!user_name
This will return true if the expression is truthy and false if it is falsy.
=end
