
#display all rounds and stats for user
# get ':user_id/index' do
  # displays all rounds played with stats for logged in user
  # erb :'rounds/index'
# end

post '/rounds' do
  round = Round.create()
  deck = Deck.find(params[:deck][:id])
  session[:round_id] = round.id
  session[:deck_id] = deck.id
  require 'pry'; binding.pry
  redirect "/guesses/new"
end
