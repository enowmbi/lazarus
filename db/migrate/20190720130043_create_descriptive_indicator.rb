class CreateDescriptiveIndicator < ActiveRecord::Migration[5.2]
	def change
		create_table :descriptive_indicators do |t|
			t.string        :name
			t.string        :desc
			t.integer       :describable_id
			t.string        :describable_type
			t.timestamps
		end
	end
end
