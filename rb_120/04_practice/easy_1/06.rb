class Cube
  attr_accessor :volume

  def initialize(volume)
    @volume = volume
  end
end

# other possiblities:
# use: instance_variable_get method
# add an attr_reader method
# add def volume; @volume; end
