require 'pry'

class Clock
  MINS_PER_HOUR = 60
  HOURS_PER_DAY = 24
  MINS_PER_DAY = MINS_PER_HOUR * HOURS_PER_DAY

  def initialize(hour, minute)
    raise StandardError unless valid_time?(hour, minute)
    @hour = hour
    @min = minute
  end

  def self.at(hour, minute = 0)
    Clock.new(hour, minute)
  end

  def +(added_minutes)
    new_min = @min + added_minutes
    added_hour, new_min = new_min.divmod(MINS_PER_HOUR)
    new_hour = (@hour + added_hour) % HOURS_PER_DAY
    Clock.new(new_hour, new_min)
  end

  def -(minutes)
    minutes_to_add = (MINS_PER_DAY - minutes) % MINS_PER_DAY
    self + minutes_to_add
  end

  def to_s
    format("%02d:%02d", @hour, @min)
  end

  def ==(other)
    @hour == other.hour && @min == other.min
  end

  protected
  attr_reader :hour, :min

  private

  def valid_time?(hour, minute)
    (0...24).cover?(hour) && (0...60).cover?(minute)
  end
end
