class Guess < ActiveRecord::Base
	belongs_to :round
	belongs_to :card

# add method to pull randomly from unplayed cards (round 1)
# add method to return boolean if cards are all played once
# add method to pull randomly from all cards in deck after round 1 is complete
# add method to increment count of play


end