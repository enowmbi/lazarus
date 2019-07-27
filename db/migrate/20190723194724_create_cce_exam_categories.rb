class CreateCceExamCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :cce_exam_categories do |t|
      t.string      :name
      t.string      :desc
      t.timestamps
    end
  end
end
