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

  @guess = Guess.create(round_id: params[:round_id], card_id: params[:card_id], correct_guess: result)
  @round = Round.find(@guess.round_id)
  @card = Card.find(@guess.card_id)
  # require 'pry'; binding.pry
  erb :'cards/show'
end


get '/rounds/:round_id/guesses/new/' do
  #create new guess entries for each card in requested deck

  @deck = Deck.find_by(id: params[:deck_id]).cards.all

   #add user id in here if logged in
  @deck.cards.each do |card|
    Guess.create(card: card_id, round_id: @round.id)
  end

#select random card to kick off game
# missing a guess card to call next_guess function on
  playcard = Guess.next_guess

  redirect "/rounds/:round_id/guesses/#{playcard.id}/edit"
end

get '/rounds/:round_id/guesses/:id/edit' do
  @guess = Guess.find(params[:id])
  @card = Card.find(@guess.card_id)
  erb :'guess/edit' #form takes in answer from player
end

put '/rounds/:round_id/guesses/:id' do
#get answer from deck
#check if answer is correct
#if answer is correct, call guess method in model to change boolean to true and set string variable correct! to true
#call method to get id of next card question (via guess.card_id)
  #if cards have all been guessed correctly, get round id
    erb :'round/stats'
  #else show answer
    #view will need if answer was correct or not
    #show route will show card answer
    #next button to get next card

    erb :'guess/show'
    # need to get from 'guess/show' to next guess using Guess.next_guess method
  #redirect "/rounds/:round_id/guesses/#{@guess_id}/"
  # end
end

get '/rounds/:round_id/guesses/:id' do
#show correct answer and next button to next question
 erb :'guess/show'
end
