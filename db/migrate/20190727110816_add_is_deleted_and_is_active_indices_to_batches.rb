class AddIsDeletedAndIsActiveIndicesToBatches < ActiveRecord::Migration[5.2]
  def change
    add_index :batches,[:is_deleted,:is_active]
  end
end
