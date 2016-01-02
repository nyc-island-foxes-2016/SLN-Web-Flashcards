get '/decks' do
  @all_decks = Deck.all
  erb :'decks/index'
end
