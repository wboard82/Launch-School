require 'date'

class Meetup
  def initialize(year, month)
    @year = year
    @month = month
  end

  def day(weekday, descriptor)
    weekday = weekday.capitalize
    descriptor = descriptor.downcase

    find_date(weekday, descriptor)
  end

  private

  def find_date(weekday, descriptor)
    @date = Date.civil(@year, @month, 1)
    day_offset = (Date::DAYNAMES.index(weekday) - @date.wday) % 7
    @date += day_offset

    send(descriptor)
    @date
  end

  def teenth
    case @date.day
    when (1..5) then @date += 14
    else @date += 7
    end
  end

  def fifth
    month = @date.month
    @date += 28
    @date = nil if month != @date.month
  end

  def last
    month = @date.month
    @date += 28
    @date -= 7 if month != @date.month
  end

  def first
    @date
  end

  def second
    @date += 7
  end

  def third
    @date += 14
  end

  def fourth
    @date += 21
  end
end
