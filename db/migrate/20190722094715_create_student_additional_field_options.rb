class CreateStudentAdditionalFieldOptions < ActiveRecord::Migration[5.2]
	def change
		create_table :student_additional_field_options do |t|
			t.integer :student_additional_field_id
			t.string :field_option
			t.timestamps
		end
	end
end
