class Card < ActiveRecord::Base
  belongs_to :deck
  has_many :guesses
  has_many :rounds, through: :guesses
  has_many :users, through: :guesses

  def check_card_against_guess?(guess_string)
    self.answer == guess_string
  end

end
