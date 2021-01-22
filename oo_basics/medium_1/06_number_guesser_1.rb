class GuessingGame
  def play
    @number = rand(1..100)
    guess = nil
    guesses = 7

    loop do
      if guesses == 0
        puts "You have no more guesses. You lost!"
        break
      end

      puts "You have #{guesses} guesses remaining."
      loop do
        print "Enter a number between 1 and 100: "
        guess = gets.chomp.to_i
        break if (1..100).cover?(guess)
        print "Invalid guess. "
      end

      if guess < number
        puts "Your guess is too low."
      elsif guess > number
        puts "Your guess is too high."
      else
        puts "That's the number!"
        puts
        puts "You win!"
        break
      end

      guesses -= 1
    end
  end

  private

  attr_reader :number
end

game = GuessingGame.new
game.play

game.play
