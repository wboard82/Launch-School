class Television
  def self.manufacturer
    # method logic
  end

  def model
    # method logic
  end
end

tv = Television.new
tv.manufacturer # error undefined method
tv.model

Television.manufacturer
Television.model # error undefined method
