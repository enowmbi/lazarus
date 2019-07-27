class AddExamCategoryIdToExamGroups < ActiveRecord::Migration[5.2]
  def change
    add_column :exam_groups, :cce_exam_category_id, :integer
  end
end
