class Round < ActiveRecord::Base
  belongs_to :user
  has_many :guesses


for each round
  1) save deck of cards as an object in round
  2) set a user profile for the play - either a logged in user or a temp user
  3) play each round
    - variable: total number of cards at start of play
    - increment total @ of guesses for each play and check against total number of cards
    - increment first round correct until hit total number of guesses > total number of cards
    - check total number of cards in dech each time and end when 0




end