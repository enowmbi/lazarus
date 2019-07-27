class CreateCceGrades < ActiveRecord::Migration[5.2]
  def change
    create_table :cce_grades do |t|
      t.string    :name
      t.float     :grade_point
      t.integer   :cce_grade_set_id
      t.timestamps
    end
  end
end
