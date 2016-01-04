require 'bcrypt'

class User < ActiveRecord::Base
	has_many :rounds
	has_many :guesses, through: :rounds
	has_many :cards, through: :guesses
	has_many :decks, through: :cards

  include BCrypt

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end



end
