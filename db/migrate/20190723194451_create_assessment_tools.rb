class CreateAssessmentTools < ActiveRecord::Migration[5.2]
  def change
    create_table :assessment_tools do |t|
      t.string        :name
      t.string        :desc
      t.integer       :descriptive_indicator_id
      t.timestamps
    end
  end
end
