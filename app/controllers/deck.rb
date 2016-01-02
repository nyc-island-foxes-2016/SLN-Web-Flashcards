get '/decks' do
	@all_decks = Deck.all
	erb :'decks/show'
end

get '/decks/:id' do
	@deck = Deck.find_by(id: params[:id])
	@all_deck_cards = @deck.cards
	erb :'cards/show'
end

post '/decks/guess/:id' do
	@card= Card.find_by(id: params[:id])
	@user_answer = params[:flashcard][:answer]
	@guess = Guess.create(number_plays: +1,card_id: @card.id)
	binding.pry
	redirect "/"

	
end