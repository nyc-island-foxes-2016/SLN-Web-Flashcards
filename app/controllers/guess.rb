get '/guesses/new' do
  deck = Deck.find(session[:deck_id])
  @cards = deck.cards.pluck(:id)
  @round = session[:round_id]

  next_card_id = Guess.next_card(@round, @cards)

  if next_card_id
    @card = Card.find(Guess.next_card(@round, @cards))
    erb :'/guesses/new'
  else
    @round = Round.find(session[:round_id])
    @deck_name = @round.guesses.first.deck.name
    @total_cards = @cards.count
    @correct_on_first = @round.guesses.where(number_plays: 1).count
    @total_guesses = @round.guesses.sum(:number_plays)
    erb :'/rounds/show'
  end
end

post '/guesses/new' do
  current_card = Card.find(params[:card_id])
  result = current_card.check_card_against_guess?(params[:answer])
  @current_guess = Guess.find_by(round_id: params[:round_id], card_id: params[:card_id])

  if @current_guess
    @current_guess.update_attributes(correct_guess: result, number_plays: @current_guess.number_plays + 1)
  else
    @current_guess = Guess.create(round_id: params[:round_id], card_id: params[:card_id], correct_guess: result)
  end

  @round = Round.find(@current_guess.round_id)
  @card = Card.find(@current_guess.card_id)
  erb :'cards/show'
end
