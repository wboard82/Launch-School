class Banner
  def initialize(message)
    self.width = message.size + 2
    self.message = message
  end

  def to_s
    [horizontal_rule, empty_line, message_line, empty_line, horizontal_rule].join("\n")
  end

  private
  attr_accessor :width
  attr_writer :message

  def horizontal_rule
    "+" + "-" * width + "+"
  end

  def empty_line
    "|" + " " * width + "|"
  end

  def message_line
    "| #{@message} |"
  end

end

banner = Banner.new('To boldly go where no one has gone before.')
puts banner
=begin
+--------------------------------------------+
|                                            |
| To boldly go where no one has gone before. |
|                                            |
+--------------------------------------------+
=end

banner = Banner.new('')
puts banner
=begin
+--+
|  |
|  |
|  |
+--+
=end


#continue do the further exploration
