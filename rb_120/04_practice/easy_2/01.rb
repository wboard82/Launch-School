class Oracle
  def predict_the_future
    "You will " + choices.sample
  end

  def choices
    ["eat a nice lunch", "take a nap soon", "stay at work late"]
  end
end

oracle = Oracle.new
oracle.predict_the_future

# The expected output will be "You will <something>" where <something> is chosen
# randomly from the return value of choices. Since choices returns an array of
# size 3, we will get one of the three elements as <something> each time.
