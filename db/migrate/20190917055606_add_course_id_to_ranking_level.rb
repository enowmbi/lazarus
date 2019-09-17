class AddCourseIdToRankingLevel < ActiveRecord::Migration[5.2]
  def change
    add_column :ranking_levels, :course_id, :integer
  end
end
