# add method to count number of single guesses for a round id
# add a method to count total number of guesses for a round id

get 'round/new'
  round = Round.create()

  # can make a start button that leads to guesses/new

  redirect '/rounds/#{round.id}/guesses/new/'
end

#display all rounds and stats for user
get ':user_id/index' do
  # displays all rounds played with stats for logged in user
  erb :'rounds/index'
end




