class Round < ActiveRecord::Base
  belongs_to :user
  has_many :guesses

end