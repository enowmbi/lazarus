class AddObservationKindToObservationGroups < ActiveRecord::Migration[5.2]
  def change
    add_column :observation_groups, :observation_kind, :string
  end
end
