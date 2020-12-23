
# Call - #map ON [[[1], [2], [3], [4]], [['a'], ['b'], ['c']]]
#        Return: new transformed array. Each element determined by return value
#                of block execution
[[[1], [2], [3], [4]], [['a'], ['b'], ['c']]].map do |element1|

  # Call - #each ON outer arraysubarrays [[1], [2], [3], [4]] and [['a'], ['b'], ['c']]
  #        Return: original subarrays USED by #map to create transformed array
  element1.each do |element2|

    # Call - #partition on each element of sub-sub-array (i.e. [1], [2]...['b'], ['c'])
    #        Return: an array with two subarrays for each element. NOT USED
    element2.partition do |element3|

      # Call - #size on each element of sub-sub-array (which are each one element arrays)
      #        Return: Boolean, in this case true of each, since none are empty
      #        USED by partition to sort elements into two arrays
      element3.size > 0
    end
  end
end
# => [[[1], [2], [3], [4]], [["a"], ["b"], ["c"]]]
