class Game
  def play
    "Start the game!"
  end
end

class Bingo < Game
  def rules_of_play
    #rules of play
  end
end

=begin
Here the class Bingo inherits from Game. Game has only one method currently, and so Bingo now has
access to `play` as an instance method. If we defined a method `play` within the Bingo class definition,
it would override `Game#play` and any calls to `play` on an instance of `Bingo` would invoke
`Bingo#play` instead of `Game#play`.
=end
