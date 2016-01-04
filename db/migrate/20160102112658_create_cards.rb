class CreateCards < ActiveRecord::Migration
	def change 
		create_table :cards do |t|
			t.string :question
			t.string :answer
			t.integer :deck_id, index: true
			t.timestamps null: false
		end
	end
end
