class CreateFaGroupsSubjects < ActiveRecord::Migration[5.2]
  def change
    create_table :fa_groups_subjects, :id => false do |t|
      t.integer     :subject_id
      t.integer     :fa_group_id
    end
  end
end
