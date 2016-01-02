# add method to count number of single guesses for a round id
# add a method to count total number of guesses for a round id

#display all rounds and stats for user
get '/rounds' do
  # displays all rounds played with stats for logged in user
end

#start a new round and create guess entries for round
#redirect to edit (show?)
get '/:deck_id/round/new/' do
  # create a new round for a selected deck
  # create new guesses for the round, one per card, one attempts, 0 correct, run method to pull random entry for first round
  redirect '/guess_id/edit'
end

# enter guess for question and put data
get '/guess_id/edit' do
  # view card question
  # form to input card answer
  erb :'guess/edit'
end

put '/rounds/:id/guess_id' do
#get answer from deck
#check if answer is correct
#if answer is correct, call guess method to change boolean to true and set string variable correct! to true
#call method to get id of next card question (via guess.card_id) (next_card_id)
#'next' button in guess/show will link to 'next_card_id/edit'
erb :'guess/show'
end


for each round
  1) save deck of cards as an object in round
  2) set a user profile for the play - either a logged in user or a temp user
  3) play each round
    - variable: total number of cards at start of play
    - increment total @ of guesses for each play and check against total number of cards
    - increment first round correct until hit total number of guesses > total number of cards
    - check total number of cards in dech each time and end when 0