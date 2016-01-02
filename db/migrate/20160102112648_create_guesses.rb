class CreateGuesses < ActiveRecord::Migration
	def change
		create_table :guesses do |t|
			t.integer :number_plays
			t.integer :round_id, index: true
			t.integer :card_id, index: true
			t.timestamps null: false
		end
	end
end


