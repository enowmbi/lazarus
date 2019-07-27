class CreatePreviousExamScores < ActiveRecord::Migration[5.2]
	def change
		create_table :previous_exam_scores do |t|
			t.references :student
			t.references :exam
			t.decimal :marks, :precision => 7, :scale => 2
			t.integer :grading_level_id
			t.string :remarks
			t.boolean :is_failed
			t.timestamps
		end
	end
end
