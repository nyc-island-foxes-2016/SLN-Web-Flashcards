get '/decks' do
  @all_decks = Deck.all
  erb :'decks/index'
end

get '/decks/:id' do
  @deck = Deck.find(params[:id])
  @cards = @deck.cards
  erb :'decks/show'
end
