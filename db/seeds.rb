require 'faker'

DECK = ["1st Deck","2nd Deck","3rd Deck"]

DECK.each do |name|
	Deck.create(name: name)
end

CARDS = Array.new(15) {
						{ question: "What number is it",
						  answer: Faker::Number.between(1, 10)
						}
					  }

CARDS.each do |card_params|
  Card.create(card_params)
end

USERS = Array.new(2) {
                         {name: Faker::Name.name
                         }
                        }

USERS.each do |name|
  User.create(name)
end