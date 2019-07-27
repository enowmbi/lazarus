class AddGpaCwaIndices < ActiveRecord::Migration[5.2]
	def change
		add_index :grouped_exams,[:batch_id,:exam_group_id]
		add_index :previous_exam_scores,[:student_id,:exam_id]
	end
end
