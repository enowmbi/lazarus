class AddExamIdToCceReports < ActiveRecord::Migration[5.2]
  def change
    add_column :cce_reports, :exam_id, :integer
  end
end
