class CreateFaCriterias < ActiveRecord::Migration[5.2]
	def change
		create_table :fa_criterias do |t|
			t.string  :fa_name
			t.string  :desc
			t.integer :fa_group_id
			t.timestamps
		end
	end
end
