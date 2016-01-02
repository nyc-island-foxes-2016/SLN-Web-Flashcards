# add method to count number of single guesses for a round id
# add a method to count total number of guesses for a round id

#display all rounds and stats for user
get '/rounds/index' do
  # displays all rounds played with stats for logged in user
  erb :'rounds/index'
end



