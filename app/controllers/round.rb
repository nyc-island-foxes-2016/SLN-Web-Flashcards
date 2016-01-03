# add method to count number of single guesses for a round id
# add a method to count total number of guesses for a round id

# get '/rounds' do
#   @round = Round.new()
#   erb :'rounds/show'
# end


get '/rounds/new' do
  @round = Round.new()
  erb :'rounds/'
end

#display all rounds and stats for user
get ':user_id/index' do
  # displays all rounds played with stats for logged in user
  erb :'rounds/index'
end




