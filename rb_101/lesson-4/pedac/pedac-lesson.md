Data structure:
[
  [2],
  [4, 6],
  [8, 10, 12],
  [14, 16, 18, 20]
]


Algorithm:

START

    - Given integer, `row_num`
    - Set `sequence` variable to be newly created sequence (subroutine)
    - SET `sum` to 0
    - Access `row_num` in `sequence` and add up all numbers in that row
    - Return `sum`

    SUBROUTINE create_sequence (integer -> nested array)
        - Given `row_num` which is an integer denoting how many rows in the structure,
          and also how many elements are in that final row
        - SET `current_number` = 2
        - SET `result` = []
        - SET `outer_counter` = 1
        - WHILE `outer_counter` <= `row_num`
            - SET `current_row` = []
            - SET `inner_counter` = outer_counter

            - WHILE `inner_counter` > 0
                - Push `current_number` onto `current_row`
                - Increment `current_number` += 2
                - Decrement `inner_counter` -= 1

            - Push `current_row` onto `result`
            - Increment `outer_counter` += 1
        - Return result



