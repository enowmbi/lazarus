class CreatePrivilegeTags < ActiveRecord::Migration[5.2]
  def change
    create_table :privilege_tags do |t|
      t.string :name_tag
      t.integer :priority
      t.timestamps
    end
  end
end
