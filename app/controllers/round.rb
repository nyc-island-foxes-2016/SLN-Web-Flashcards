
#display all rounds and stats for user
# get ':user_id/index' do
  # displays all rounds played with stats for logged in user
  # erb :'rounds/index'
# end

post '/rounds' do

  if logged_in?
    round = Round.create(user_id: current_user.id)
  else
    round = Round.create()
  end

  deck = Deck.find(params[:deck][:id])
  session[:round_id] = round.id
  session[:deck_id] = deck.id
  redirect "/guesses/new"
end
