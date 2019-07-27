class CreateFaGroups < ActiveRecord::Migration[5.2]
	def change
		create_table :fa_groups do |t|
			t.string      :name
			t.text        :desc
			t.integer     :cce_exam_category_id
			t.timestamps
		end
	end
end
