# Lists In Python

https://docs.python.org/3/library/stdtypes.html#list

## List Basics

* Ordered, indexed collection of elements
* 0 indexed
* Holds other types, including other containers
* May hold multiple types: `[1, 'a', True]`
* May be nested: `[[1, 2], [3, 4]]`
* Basic type, built-in to Python
* [*Sequence* type](https://docs.python.org/3/library/stdtypes.html#list) (others: `tuples` and `ranges`, also `str` and more)
* [*Mutable sequence*](https://docs.python.org/3/library/stdtypes.html#mutable-sequence-types) type

## Creating a List

* Empty list: <br>`[]` or `list()`
* Literal: <br>`[1]` or `[1, 'a', True]`
* List comprehension: <br>`[x for xs in iterable]`
* Constructor: <br>`list(iterable)`

## Accessing Single Items

`my_list = ['a', 'b', 'c', 'd']`

* Single item at an index: <br>`my_list[idx]`
* First item of a list: <br>`my_list[0] # => 'a'`
* Last item of a list: <br>`my_list[-1] # => 'd'`

## Accessing Multiple Items (Slices)

Basic syntax: <br>`list_name[start_idx:up_to_idx:step_size]`

* When start_idx is omitted, `0` is used
* When up_to_idx is omitted, `len()` is used

Some examples:
* Indexes 0 to 2 (not inclusive): <br>`my_list[0:2]  # => ['a', 'b']`
* From 2 **through** the end: <br>`my_list[2:]  # => ['c', 'd']`
* From the beginning **up to** 2: <br>`my_list[:2] # => ['a', 'b']`
* From the beginning **up to** second-to-last: <br>`my_list[:-2] # => ['a', 'b']`
* Every other item: <br>`my_list[::2]  # => ['a', 'c']`
* Last two items, in reverse: <br>`my_list[-1:-3:-1]  # => ['d', 'c']`
* Can be used to make a shallow copy of whole list: <br>`my_list[:]` (equivalent to `my_list.copy()`)

## Common Operations on a List

### Information:

* Length of list: `len(my_list)  # => 4`
* Min or max: `min(my_list) # => 1` `max(my_list) # => 4`
* Index of first occurence of object: `my_list.index(2)  # => 1`
* Count occurences of object in list: `my_list.count(2)  # => 1`

### Adding elements:

* `insert(idx, element)`
    - Inserts `element` at index `idx`
    - If `idx` is greater than `len()`, `element` will be appended to end of
        list
* `append(element)`
    - Appends `element` onto the end of the list
* `extend(iterable)`
    - `iterable` is another list or other iterable object
    - Appends each element of `iterable` onto the list

What will be the difference in result between these two pieces of code?
```python
a = [1, 2, 3]
a.append([4, 5, 6])
```
and
```python
a = [1, 2, 3]
a.extend([4, 5, 6])
```

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

    Creating a list of empty lists using the `*` uses the same object for each element of the list:
    ```python
    lists = [[]] * 3
    lists
    # => [[], [], []]

    id(lists[0])
    # => 140147742899584

    id(lists[1])
    # => 140147742899584
    ```

    Reassignment of list elements work as you might expect:
    ```python
    lists[2] = 3
    lists
    # => [[], [], 3]
    ```

    But mutating a list element will affect them all:
    ```python
    lists = [[]] * 3
    lists[0].append(3)
    lists
    # => [[3], [3], [3]]
    ```

    Use a list comprehension to create a different object in each element:
    ```python
    lists = [[] for x in range(3)]
    id(lists[0])
    # => 140147742965440
    id(lists[1])
    # => 140147742982528
    ```

### Comparison to Ruby

* Python will throw an error in many places that Ruby returns `nil`
* Syntax is different (In python:`len(my_list)` In Ruby and javascript: `my_list.length`)
* Mutating vs. non-mutating methods:
    - In Ruby: `my_list.sort` (non-mutating). In python and javascript: `my_list.sort()` mutatest the original list/array
    - In Python: `sorted(my_list)` (non-mutating) vs. `my_list.sort` (mutating)
        - In Javascript there is no one built in method we can call that combines the creation and sorting of a new array. Python makes it easier comparatively.
    - General rule (that I can tell so far) is that methods called **on** an
        object may be mutating, but methods that **take** the object as an
        argument generally are not. (I'm sure there are exceptions!)
* Slicing:
    - In Python: `lst[begin_idx:upto_idx]`
    - Equivalent in Ruby: `lst[(begin_idx...upto_idx)]`
    - Ruby has other ways of slicing as well:
        * `list[(begin_idx..end_idx)]`
        * `list[begin_idx, num_of_elems]`
    - Javascript slicing:
        * ["a", "b", "c"].slice(0, 2);  // => [ 'a', 'b' ]
        * The python syntax different from what Javascript students are used to.  Just remember that the start index and end index specifications work the same in python and javascript.

* Other Notes about Javascript
    - You cannot specify an index to pop() a value in javascript. In JS, pop() takes no arguments and will always remove and return the last element in the array
    - Python's append() method is the same as javscript's push() method



