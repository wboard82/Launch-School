module Taste
  def flavor(flavor)
    puts "#{flavor}"
  end
end

class Orange
  include Taste
end

class HotSauce
  include Taste
end

# You can find the ancestors of an object by calling #ancestors on the object's
# class. This will return an array of classes and modules in the order of the
# lookup chain.
#
# The look up chain for Orange will be:
# Orange, Taste, Object, Kernel, BasicObject
#
# The look up chain for HotSauce will be:
# HotSauce, Taste, Object, Kernel, BasicObject

