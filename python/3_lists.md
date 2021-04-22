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

Basic syntax: `list_name[start_idx:up_to_idx:step_size]`

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

### Adding elements:

* `insert()`, `append()`, `extend()`
* !!!


### Removing Elements:

* Three main ways: `del`, `remove()`, and `pop()`
* To remove a certain value use `remove()`:
    - Removes the *first occurence* of the given value
    - Raises an error if the value does not exist
    - Does not return the value
    - `my_list.remove(val)`
* To remove *and return* element at specific index use `pop()`
    - `my_list.pop()` removes and returns the last element
    - `my_list.pop(1)` removes and returns the element at index `1`
    - Raises an error if the index does not exist
* To remove element(s) at specific index without returning it use `del`
    - `del my_list[1]` deletes element at index `1`
    - Raises an error if index does not exist
    - Can be used on slices:
        * Remove from index 1 up to 3: `del my_list[1:3]`
        * Remove from index 2 to the end of list: `del my_list[2:]`
        * Remove every other item in list: `del my_list[::2]`
    - Using `del` with slices will not raise an error!

## Gotchas

* Creating a list programmatically with the `*` operator:
    - !!!

### Differences from Ruby

* Python will throw an error in many places that Ruby returns `nil`
* Syntax is different (i.e. `len(my_list)` vs `my_list.length`)
* Mutating vs. non-mutating methods:
    - In Ruby: `my_list.sort` (non-mutating) vs. `my_list.sort!` (mutating)
    - In Python: `sorted(my_list)` (non-mutating) vs. `my_list.sort` (mutating)
    - General rule (that I can tell so far) is that methods called **on** an
        object may be mutating, but methods that **take** the object as an
        argument generally are not. (I'm sure there are exceptions!)

