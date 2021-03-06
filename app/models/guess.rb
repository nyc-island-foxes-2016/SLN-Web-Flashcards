class Guess < ActiveRecord::Base
	belongs_to :round
	belongs_to :card
  has_one :deck, through: :card


  def self.next_card(round_id, card_ids)
    all_guesses = Guess.where(round_id: round_id).pluck(:card_id)

    all_incorrect_guesses = Guess.where(round_id: round_id, correct_guess: false).pluck(:card_id)

    if all_guesses.length < card_ids.length
      card_ids.select {|card| !all_guesses.include?(card)}.sample #gives remaining cards to play
    elsif all_incorrect_guesses.length > 0
      all_incorrect_guesses.sample
    else
      nil
    end

  end
end
