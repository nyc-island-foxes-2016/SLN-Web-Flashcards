#start a new round and create guess entries for round
#redirect to (show?)

get '/guesses/new' do
  deck = Deck.find(session[:deck_id])
  @cards = deck.cards.pluck(:id)
  @round = session[:round_id]
  @card = Card.find(Guess.next_card(@round, @cards))
  erb :'/guesses/new'
end

post '/guesses/new' do
  current_card = Card.find(params[:card_id])

  result = current_card.check_card_against_guess?(params[:answer])

  current_guess = Guess.find_by(round_id: params[:round_id], card_id: params[:card_id])

  if current_guess
    require 'pry'; binding.pry
    current_guess.update_attributes(correct_guess: result, number_plays: current_guess.number_plays + 1)
  else
    @guess = Guess.create(round_id: params[:round_id], card_id: params[:card_id], correct_guess: result)
  end
  @round = Round.find(@guess.round_id)
  @card = Card.find(@guess.card_id)
  erb :'cards/show'
end
