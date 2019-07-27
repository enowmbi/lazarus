class RemoveLogoColumnsFromSchoolDetail < ActiveRecord::Migration[5.2]
  def change
    remove_column :school_details,:logo_file_name,:string
    remove_column :school_details,:logo_content_type,:string
    remove_column :school_details,:logo_file_size,:integer
  end
end
