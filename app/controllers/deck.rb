get '/decks' do
	@all_decks = Deck.all
	erb :'decks/show'
end

get '/decks/:id' do
	@deck = Deck.find_by(id: params[:id])
	@all_deck_cards = @deck.cards
	erb :'cards/show'
end