class AddGradingTypeToCourses < ActiveRecord::Migration[5.2]
	def change
		add_column :courses, :grading_type, :string
	end
end
