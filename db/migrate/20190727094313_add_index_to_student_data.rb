class AddIndexToStudentData < ActiveRecord::Migration[5.2]
	def change
		add_index :students, [:nationality_id,:immediate_contact_id,:student_category_id], :name => "student_data_index2"
		add_index :student_additional_details, [:student_id,:additional_field_id], :name => "student_data_index"

	end
end
