# Create an object

module Play
  def play(sound)
    puts sound
  end
end

class Instrument
  include Play
end

trumpet = Instrument.new
trumpet.play("Do do")
