class Guess < ActiveRecord::Base
	belongs_to :round
	belongs_to :card

  def next_guess

    if Guess.find_by(number_plays: 0, round_id: self.round_id)
      @playcard = Guess.where(number_plays: 0, round_id: self.round_id).order("RANDOM()").first
    elsif Guess.find_by(correct_guess: false, round_id: self.round_id)
      @playcard = Guess.where(correct_guess: false, round_id: self.round_id).order("RANDOM()").first
    else
      #return something indicating complete
    end

    @playcard.update_attributes(number_plays: :number_plays + 1)

    # binding.pry
    @playcard
  end
end
