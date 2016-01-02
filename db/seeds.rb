require 'faker'

DECK = ["1st Deck","2nd Deck","3rd Deck"]

CARDS = Array.new(15) {
						{ question: "What number is it",
						  answer: Faker::Number.between(1, 10)
						}
					  }


DECK.each do |name|
	deck =Deck.create(name: name)
	CARDS.each do |card_params|
  	deck.cards << Card.create(card_params)
end
end


USERS = Array.new(2) {
                         {name: Faker::Name.name
                         }
                        }

USERS.each do |name|
  User.create(name)
end