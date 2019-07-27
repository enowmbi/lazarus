class AddMaxToFaGroup < ActiveRecord::Migration[5.2]
  def change
    add_column :fa_groups, :max_marks, :float, :default=>100.0
  end
end
