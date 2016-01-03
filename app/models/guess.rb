class Guess < ActiveRecord::Base
	belongs_to :round
	belongs_to :card

  def next_guess

    if Guess.find_by(number_plays: 0, round_id: self.round_id)
    #check if there are any unplayed cards, select randomly from unplayed cards

      @playcard = Guess.where(number_plays: 0, round_id: self.round_id).order("RANDOM()").first
    else
    #pull randomly from all cards that have not had a correct guess

      @playcard = Guess.where(correct_guess: false, round_id: self.round_id).order("RANDOM()").first
    end

    @playcard.update_attributes(number_plays: :number_plays + 1)
#did incrementing counter work?
    binding.pry
    @playcard

  end


end
