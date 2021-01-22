require './poker_exploration.rb'

# Three of a kind vs pair
hand00 = PokerHand.new([
  Card.new(:J,  :Clubs),
  Card.new(5, :Hearts),
  Card.new(2,  :Hearts),
  Card.new(:J,  :Hearts),
  Card.new(:J,  :Spades)
])

hand0 = PokerHand.new([
  Card.new(:A,  :Clubs),
  Card.new(5, :Hearts),
  Card.new(2,  :Hearts),
  Card.new(:A,  :Hearts),
  Card.new(:J,  :Spades)
])

puts hand00 > hand0 # three of a kind better than pair

# Two pair vs pair
hand1 = PokerHand.new([
  Card.new(9, :Hearts),
  Card.new(9, :Clubs),
  Card.new(5, :Diamonds),
  Card.new(8, :Spades),
  Card.new(5, :Hearts)
])

hand2 = PokerHand.new([
  Card.new(2, :Hearts),
  Card.new(9, :Clubs),
  Card.new(5, :Diamonds),
  Card.new(9, :Spades),
  Card.new(3, :Diamonds)
])

puts hand1 > hand2 == true # two pair better than pair

# High card
hand3 = PokerHand.new([
  Card.new(2,      :Hearts),
  Card.new(:K, :Clubs),
  Card.new(5,      :Diamonds),
  Card.new(8,      :Spades),
  Card.new(3,      :Diamonds)
])

hand4 = PokerHand.new([
  Card.new(2,      :Clubs),
  Card.new(:K, :Hearts),
  Card.new(5,      :Hearts),
  Card.new(10,      :Diamonds),
  Card.new(3,      :Clubs)
])

puts hand3 < hand4 == true # Same high card, hand4 has next high card

# Flushes
hand5 = PokerHand.new([
  Card.new(10, :Hearts),
  Card.new(:A, :Hearts),
  Card.new(2, :Hearts),
  Card.new(:K, :Hearts),
  Card.new(3, :Hearts)
])

hand6 = PokerHand.new([
  Card.new(10, :Clubs),
  Card.new(:A, :Clubs),
  Card.new(2, :Clubs),
  Card.new(:K, :Clubs),
  Card.new(3, :Clubs)
])

puts (hand5 == hand6) == true # Both flushes, same card values

# Straights
hand7 = PokerHand.new([
  Card.new(8,      :Clubs),
  Card.new(9,      :Diamonds),
  Card.new(10,     :Clubs),
  Card.new(7,      :Hearts),
  Card.new(:J, :Clubs)
])

hand8 = PokerHand.new([
  Card.new(8,       :Clubs),
  Card.new(9,       :Diamonds),
  Card.new(10,      :Clubs),
  Card.new(:Q, :Hearts),
  Card.new(:J,  :Clubs)
])

puts hand7 < hand8 == true # Both straights, hand8 has high card

# Four of a kinds
hand9 = PokerHand.new([
  Card.new(:J, :Hearts),
  Card.new(:J, :Clubs),
  Card.new(5, :Diamonds),
  Card.new(:J, :Spades),
  Card.new(:J, :Diamonds)
])

hand10 = PokerHand.new([
  Card.new(3, :Hearts),
  Card.new(3, :Clubs),
  Card.new(6, :Diamonds),
  Card.new(3, :Spades),
  Card.new(3, :Diamonds)
])

puts hand9 > hand10 == true # Jack four of a kind better than 3s

# Two pair

# Two pair, 10s and 8s
hand11 = PokerHand.new([
  Card.new(8,      :Clubs),
  Card.new(8,      :Diamonds),
  Card.new(10,     :Clubs),
  Card.new(10,      :Hearts),
  Card.new(:J, :Clubs)
])

# Two pair, 10s and 5s Queen high
hand12 = PokerHand.new([
  Card.new(5,       :Clubs),
  Card.new(5,       :Diamonds),
  Card.new(10,      :Clubs),
  Card.new(10,      :Hearts),
  Card.new(:Q,  :Clubs)
])

# Two pair, 9s and 6s
hand13 = PokerHand.new([
  Card.new(6,       :Clubs),
  Card.new(6,       :Diamonds),
  Card.new(9,      :Clubs),
  Card.new(9,      :Hearts),
  Card.new(:Q,  :Clubs)
])

# Two pair, 10s and 5s Ace high
hand14 = PokerHand.new([
  Card.new(5,       :Clubs),
  Card.new(5,       :Diamonds),
  Card.new(10,      :Clubs),
  Card.new(10,      :Hearts),
  Card.new(:A,  :Clubs)
])

# Two pair, 10s and 5s Ace high
hand15 = PokerHand.new([
  Card.new(5,       :Hearts),
  Card.new(5,       :Spades),
  Card.new(10,      :Spades),
  Card.new(10,      :Clubs),
  Card.new(:A,  :Hearts)
])
puts hand11 > hand12 == true # Equal high pair, hand11 better low pair
puts hand12 > hand13 == true # hand12 better high pair
puts hand14 > hand12 == true # Both pair equal, hand14 better kicker
puts (hand15 == hand14) == true # Equal ranks, just different suits

# Full houses
hand16 = PokerHand.new([
  Card.new(3, :Hearts),
  Card.new(3, :Clubs),
  Card.new(5, :Diamonds),
  Card.new(5, :Spades),
  Card.new(5, :Hearts)
])

hand17 = PokerHand.new([
  Card.new(3, :Hearts),
  Card.new(3, :Clubs),
  Card.new(5, :Diamonds),
  Card.new(3, :Spades),
  Card.new(5, :Hearts)
])

puts hand16 > hand17 == true # Both full houses, hand15 has better three of a kind

# Full houses
hand24 = PokerHand.new([
  Card.new(3, :Hearts),
  Card.new(3, :Clubs),
  Card.new(5, :Diamonds),
  Card.new(5, :Spades),
  Card.new(5, :Hearts)
])

hand25 = PokerHand.new([
  Card.new(:A, :Hearts),
  Card.new(:A, :Clubs),
  Card.new(5, :Diamonds),
  Card.new(5, :Spades),
  Card.new(5, :Hearts)
])

# Both full houses with same three of a kind, hand25 has better pair
puts hand24 < hand25 == true

# High cards
hand26 = PokerHand.new([
  Card.new(:J, :Hearts),
  Card.new(8, :Clubs),
  Card.new(5, :Diamonds),
  Card.new(10, :Spades),
  Card.new(:Q, :Hearts)
])

hand27 = PokerHand.new([
  Card.new(:Q, :Hearts),
  Card.new(5, :Clubs),
  Card.new(10, :Diamonds),
  Card.new(8, :Spades),
  Card.new(:J, :Hearts)
])

hand28 = PokerHand.new([
  Card.new(:J, :Hearts),
  Card.new(8, :Clubs),
  Card.new(6, :Diamonds),
  Card.new(10, :Spades),
  Card.new(:Q, :Hearts)
])

puts (hand26 == hand27) # all cards equal in rank
# ranks all equal until lowest card, hand28 higher with 6 vs 5
puts hand27 < hand28

# Testing best 5-card hand from a 7-card hand

# Method will return the best hand out of any number
# of cards passed to #new when instantiating a new PokerHand object
# (passed as an array of Card objects).
# Test cases just pass in 7 except for last one passes in 10
# to demonstrate

# Best possible hand is the flush
hand18 = Hand.new([
  Card.new(6, :Clubs),
  Card.new(:A, :Clubs),
  Card.new(2, :Clubs),
  Card.new(:K, :Clubs),
  Card.new(3, :Clubs),
  Card.new(4, :Diamonds),
  Card.new(5, :Diamonds)
])

puts PokerHand.best_hand(hand18) ==
  PokerHand.new([
    Card.new(6, :Clubs),
    Card.new(:A, :Clubs),
    Card.new(2, :Clubs),
    Card.new(:K, :Clubs),
    Card.new(3, :Clubs)
  ]) # picks flush over straight

# Best possible hand royal flush
hand19 = Hand.new([
  Card.new(:J,  :Clubs),
  Card.new(10,      :Hearts),
  Card.new(:A,   :Hearts),
  Card.new(:Q, :Hearts),
  Card.new(:K,  :Hearts),
  Card.new(:J,  :Hearts),
  Card.new(:J,  :Spades)
])

puts PokerHand.best_hand(hand19) ==
  PokerHand.new([
    Card.new(10,      :Hearts),
    Card.new(:A,   :Hearts),
    Card.new(:Q, :Hearts),
    Card.new(:K,  :Hearts),
    Card.new(:J,  :Hearts)
  ]) # picks royal flush over three of a kind

# Best possible hand high card, exclude 3 and 3
hand20 = Hand.new([
  Card.new(2,      :Hearts),
  Card.new(:K, :Clubs),
  Card.new(5,      :Diamonds),
  Card.new(8,      :Spades),
  Card.new(3,      :Diamonds),
  Card.new(:Q, :Spades),
  Card.new(10,      :Hearts)
])

puts PokerHand.best_hand(hand20) ==
  PokerHand.new([
    Card.new(:K, :Clubs),
    Card.new(5,      :Diamonds),
    Card.new(8,      :Spades),
    Card.new(:Q, :Spades),
    Card.new(10,      :Hearts)
  ]) # hand with highest valued cards

hand21 = Hand.new([
  Card.new(3, :Hearts),
  Card.new(3, :Clubs),
  Card.new(5, :Diamonds),
  Card.new(3, :Spades),
  Card.new(5, :Hearts),
  Card.new(5, :Clubs),
  Card.new(7,  :Clubs)
])

# Could make two types of full house, better one has
# three of a kind 5s and a pair of 3s
puts PokerHand.best_hand(hand21) ==
  PokerHand.new([
    Card.new(3, :Clubs),
    Card.new(5, :Diamonds),
    Card.new(3, :Spades),
    Card.new(5, :Hearts),
    Card.new(5, :Clubs)
  ])

# Best possible hand is the straight
hand22 = Hand.new([
  Card.new(8,       :Clubs),
  Card.new(9,       :Diamonds),
  Card.new(10,      :Clubs),
  Card.new(:Q, :Hearts),
  Card.new(2,       :Hearts),
  Card.new(:J,  :Clubs),
  Card.new(2,       :Diamonds)
])

puts PokerHand.best_hand(hand22) ==
  PokerHand.new([
    Card.new(8,       :Clubs),
    Card.new(9,       :Diamonds),
    Card.new(10,      :Clubs),
    Card.new(:Q, :Hearts),
    Card.new(:J,  :Clubs)
  ])

# Best possible hand is the straight with Queen high
hand23 = Hand.new([
  Card.new(8,       :Clubs),
  Card.new(9,       :Diamonds),
  Card.new(10,      :Clubs),
  Card.new(:Q, :Hearts),
  Card.new(2,       :Hearts),
  Card.new(:J,  :Clubs),
  Card.new(2,       :Diamonds),
  Card.new(5,       :Diamonds),
  Card.new(7,       :Clubs),
  Card.new(10,      :Spades)
])

puts PokerHand.best_hand(hand23) ==
  PokerHand.new([
    Card.new(8,       :Clubs),
    Card.new(9,       :Diamonds),
    Card.new(10,      :Clubs),
    Card.new(:Q, :Hearts),
    Card.new(:J,  :Clubs)
  ])
