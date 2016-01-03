#start a new round and create guess entries for round
#redirect to (show?)
get '/:deck_id/guesses/new/' do
  #create new guess entries for each card in requested deck

  @deck = Deck.find_by(id: params[:deck_id]).cards.all
  @round = Round.new() #add user id in here if logged in
  @deck.each |card| do
    Guess.new(card: card_id, round_id: @round.id)
  end

#select random card to kick off game
  @playcard = Guess.find_by(round_id: @round.id).order("RANDOM()").first

  redirect '/guesses/#{@playcard.id}/edit'
end

# post '/guesses' do
#   # create a new round for a selected deck
#   # create new guesses for the round, one per card, one attempts, 0 correct, run method to pull random entry for first round and get guess_id
#   redirect '/guesses/#{@guess_id}/edit'
# end
# enter guess for question and put data

get '/guesses/:id/edit' do
  @guess = Guess.find(params[:id])
  @card = Card.find(@guess.card_id)
  erb :'guess/edit'
end

put '/guesses/:id' do
#get answer from deck
#check if answer is correct
#if answer is correct, call guess method in model to change boolean to true and set string variable correct! to true
#call method to get id of next card question (via guess.card_id)
  #if cards have all been guessed correctly, get round id
    erb :'round/stats'
  #else get next guess id
  redirect '/guesses/#{@guess_id}/'
end

get 'guesses/:id' do
#show correct answer and next button to next question
 erb :'guess/show'
end