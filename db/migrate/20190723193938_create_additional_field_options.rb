class CreateAdditionalFieldOptions < ActiveRecord::Migration[5.2]
  def change
    create_table :additional_field_options do |t|
      t.integer :additional_field_id
      t.string :field_option
      t.integer :school_id
      t.timestamps
    end
  end
end
