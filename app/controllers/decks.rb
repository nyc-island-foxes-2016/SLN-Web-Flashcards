get '/decks' do
  @all_decks = Deck.all
  erb :'decks/index'

  #view: list all deck names, each hyperlinking to a new round initiation (round/new)

end

get '/decks/:id' do
  @deck = Deck.find(params[:id])
  @cards = @deck.cards
  erb :'decks/show'
end
