class AddMaxMarksToObservationGroups < ActiveRecord::Migration[5.2]
  def change
    add_column :observation_groups, :max_marks, :float
  end
end
