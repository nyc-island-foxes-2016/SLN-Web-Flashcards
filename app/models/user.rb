class User < ActiveRecord::Base
	has_many :rounds
	has_many :guesses, through: :rounds
	has_many :cards, through: :guesses
	has_many :decks, through: :cards
end