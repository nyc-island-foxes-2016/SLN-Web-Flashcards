#start a new round and create guess entries for round
#redirect to (show?)
get '/:deck_id/guesses/new/' do
  erb :'/guess/new'
end

post '/guesses' do
  # create a new round for a selected deck
  # create new guesses for the round, one per card, one attempts, 0 correct, run method to pull random entry for first round and get guess_id
  redirect '/guesses/:id/edit'
end

get 'guesses/:id'
#show correct answer and next button to next question
 erb :'guess/show'
end

# enter guess for question and put data
get '/guesses/:id/edit' do
  # view card question
  # view has form to input card answer
  erb :'guess_id/edit'
end

put '/guesses/:id' do
#get answer from deck
#check if answer is correct
#if answer is correct, call guess method in model to change boolean to true and set string variable correct! to true
#call method to get id of next card question (via guess.card_id)
  #if cards have all been guessed correctly, get round id
    erb :'round/stats'
  #else get next guess id
  redirect '/guesses/:id/'
end
