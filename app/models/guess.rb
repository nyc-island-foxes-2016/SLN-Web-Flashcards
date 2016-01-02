class Guess < ActiveRecord::Base
	belongs_to :round
	belongs_to :card

# add method to pull randomly from unplayed cards
  #first pull from cards that haven't been played yet
  #if all cards have been played, randomly select from cards that haven't been answered correctly
# add method to return boolean once all cards are all played once
# add method to increment count of play for each card



end