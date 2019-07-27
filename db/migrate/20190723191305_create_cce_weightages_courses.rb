class CreateCceWeightagesCourses < ActiveRecord::Migration[5.2]
  def change
    create_table :cce_weightages_courses, :id => false do |t|
      t.integer     :cce_weightage_id
      t.integer     :course_id
    end
  end
end
