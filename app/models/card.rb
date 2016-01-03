class Card < ActiveRecord::Base
  belongs_to :deck
  has_many :guesses

def check_card_against_guess?(guess_string)
  self.answer == guess_string
end


end
