
# require 'faker'

DECK = ["1st Deck","2nd Deck","3rd Deck"]

# CARDS = Array.new(15) {
#             { question: "What number is it",
#               answer: Faker::Number.between(1, 10)
#             }
#             }


# DECK.each do |name|
#   deck =Deck.create(name: name)
#   CARDS.each do |card_params|
#     deck.cards << Card.create(card_params)
# endq
# end


# USERS = Array.new(2) {
#                          {name: Faker::Name.name
#                          }
#                         }

# USERS.each do |name|
#   User.create(name)
# end

CARDS = Array.new [
  { question: "What's a dog?",
    answer: "a pet"},
  { question: "What color is the sky?",
    answer: "blue"},
  { question: "What is 1 + 1?",
    answer: "2"},
  { question: "Who is President of the US?",
    answer: "Obama"}
]

DECK.each do |name|
  deck = Deck.create(name: name)
  CARDS.each do |card_params|
    deck.cards << Card.create(card_params)
  end
end
