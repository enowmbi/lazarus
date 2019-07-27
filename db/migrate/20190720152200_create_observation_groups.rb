class CreateObservationGroups < ActiveRecord::Migration[5.2]
	def change
		create_table :observation_groups do |t|
			t.string        :name
			t.string        :header_name
			t.string        :desc
			t.string        :cce_grade_set_id
			t.timestamps
		end
	end
end
