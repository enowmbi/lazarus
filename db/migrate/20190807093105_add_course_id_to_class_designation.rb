class AddCourseIdToClassDesignation < ActiveRecord::Migration[5.2]
  def change
    add_column :class_designations, :course_id, :integer
  end
end
