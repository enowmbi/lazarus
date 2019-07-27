class CreateCoursesObservationGroups < ActiveRecord::Migration[5.2]
	def change
		create_table :courses_observation_groups, :id => false do |t|
			t.integer     :course_id
			t.integer     :observation_group_id
		end
	end
end
