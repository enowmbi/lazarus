class CreateObservations < ActiveRecord::Migration[5.2]
	def change
		create_table :observations do |t|
			t.string          :name
			t.string          :desc
			t.boolean         :is_active
			t.integer         :observation_group_id
      t.timestamps
		end
	end
end
