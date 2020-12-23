=begin
Write a method that displays an 8-pointed star in an nxn grid, where n is an odd integer
that is supplied as an argument to the method. The smallest such star you need to handle is a 7x7 grid.

PROBLEM:
IN/OUT: Integer (odd) -> output (star in n x n grid)
- Odd, positive number
- 7 is smallest number to deal with
- Display 8-pointed star

EXAMPLES:

star(7)

*  *  *    <- 3 stars, centered, with 2 spaces 
 * * *     <- 3 stars, centered with one space
  ***      <- this has 3 stars, centered, with no spaces
*******    <- this line has 'n' *s
  ***
 * * *
*  *  *

star(9)

*   *   *  <- (n - 3) / 2 spaces
 *  *  *
  * * *
   ***
*********
   ***
  * * *
 *  *  *
*   *   *

- Top line is always * * * separated by (n-3)/2 spaces
- n/2 lines above the middle and n/2 below
- middle is always n *s in a row, no spaces
- all rows are centered in a grid of size 9


ALGORITHM
- Given a number, 'n'
- Check that 'n' >= 7 and 'n' is odd
- SET 'spaces' = (n - 3) / 2
- LOOP (n / 2) times:
  - output '*' + ' ' * 'spaces' + '*' + ' ' * 'spaces + '*' (centered in n spaces)
  - SET 'spaces' -= 1
- OUTPUT n * '*'
- LOOP (n / 2) times:
  - output '*' + ' ' * 'spaces' + '*' + ' ' * 'spaces + '*' (centered in n spaces)
  - SET 'spaces' += 1
=end

def star(n)
  unless n >= 7 && n.odd?
    puts "Number must be odd and greater than or equal to 7"
    return
  end


  spaces = (n - 3) / 2
  (n / 2).times do
    puts ('*' + (' ' * spaces) + '*' + (' ' * spaces) + '*').center(n)
    spaces -= 1
  end
  puts '*' * n

  spaces = 0
  (n / 2).times do
    puts ('*' + (' ' * spaces) + '*' + (' ' * spaces) + '*').center(n)
    spaces += 1
  end

end

star(17)
star(11)






