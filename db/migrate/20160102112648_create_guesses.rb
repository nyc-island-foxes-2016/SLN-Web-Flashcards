class CreateGuesses < ActiveRecord::Migration
	def change
		create_table :guesses do |t|
			t.integer :number_plays, default: 1
			t.integer :round_id, index: true
			t.integer :card_id, index: true
			t.boolean :correct_guess, null: false, default: false
			t.timestamps null: false
		end
	end
end


