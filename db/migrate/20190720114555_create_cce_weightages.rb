class CreateCceWeightages < ActiveRecord::Migration[5.2]
  def change
    create_table :cce_weightages do |t|
      t.integer     :weightage
      t.string      :criteria_type
      t.integer     :cce_exam_category_id
      t.timestamps
    end
  end
end
