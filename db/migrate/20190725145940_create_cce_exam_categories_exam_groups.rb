class CreateCceExamCategoriesExamGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :cce_exam_categories_exam_groups, :id => false do |t|
      t.integer :cce_exam_category_id
      t.integer :exam_group_id
      t.timestamps
    end
  end
end
