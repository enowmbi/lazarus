class CreateSubjectAmounts < ActiveRecord::Migration[5.2]
  def change
    create_table :subject_amounts do |t|
      t.references :course
      t.decimal :amount
      t.string :code
      t.timestamps
    end
  end
end
