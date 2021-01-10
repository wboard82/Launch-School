class Oracle
  def predict_the_future
    "You will " + choices.sample
  end

  def choices
    ["eat a nice lunch", "take a nap soon", "stay at work late"]
  end
end

class RoadTrip < Oracle
  def choices
    ["visit Vegas", "fly to Fiji", "romp in Rome"]
  end
end

trip = RoadTrip.new
trip.predict_the_future

# Here RoadTrip#choices overrides Oracle#choices, so when `choices` is called
# from within the `predict_the_future` method, it calls RoadTrip#choices
# instead. This is because `choices` is implicitly called on `self`, the calling
# object. In that object's lookup path, it will first find `RoadTrip#choices`
# and so that will be executed and the lookup will cease.
