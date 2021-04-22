# Lists In Python

https://docs.python.org/3/library/stdtypes.html#list

## List Basics

* Ordered, indexed collection of elements
* 0 indexed
* Holds other types, including other containers
* May hold multiple types
* Basic type, built-in to Python
* [*Sequence* type](https://docs.python.org/3/library/stdtypes.html#list) (`tuples` and `ranges`, also `str` and others)
* [*Mutable sequence*](https://docs.python.org/3/library/stdtypes.html#mutable-sequence-types) type

## Creating a List

* Empty list: `[]` or `list()`
* Literal: `[1]` or `[1, 'a', True]`
* List comprehension: `[x for x in iterable]`
* Constructor: `list(iterable)`

## Accessing Single Items

`my_list = ['a', 'b', 'c', 'd']`

* Single item at an index: `my_list[idx]`
* First item of a list: `my_list[0] # => 'a'`
* Last item of a list: `my_list[-1] # => 'd'`

## Accessing Multiple Items (Slices)

* `list_name[start_idx:up_to_idx:step_size]`
* Indexes 0 to 2 (not inclusive): `my_list[0:2]  # => ['a', 'b']`
* From 2 **through** the end: `my_list[2:]  # => ['c', 'd']`
* From the beginning **up to** 2: `my_list[:2] # => ['a', 'b']`
* From the beginning **up to** second-to-last: `my_list[:-2] # => ['a', 'b']`
* When first index is omitted, `0` is used
* When second index is omitted, `len()` is used
* Every other item: `my_list[::2]  # => ['a', 'c']`
* Last two items, in reverse: `my_list[-1:-3:-1]  # => ['d', 'c']`

## Common Operations on a List

### Information:

* Length of list: `len(my_list)  # => 4`
* Min or max: `min(my_list) # => 1` `max(my_list) # => 4`
* Index of first occurence of object: `my_list.index(2)  # => 1`
* Count occurences of object in list: `my_list.count(2)  # => 1`
* 

### Adding elements:

### Deleting elements:

### 



+---------------+----------------------------+---------------------------+---------------------------+
| Operation     | Python                     | Ruby                      | JS                        |
+---------------+----------------------------+---------------------------+---------------------------+


## Gotchas

