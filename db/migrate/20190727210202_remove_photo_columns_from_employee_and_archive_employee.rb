class RemovePhotoColumnsFromEmployeeAndArchiveEmployee < ActiveRecord::Migration[5.2]
  def self.up
    remove_column :employees, :photo_file_size 
    remove_column :employees, :photo_file_name 
    remove_column :employees, :photo_content_type 
    remove_column :employees, :photo_data 
    remove_column :archived_employees, :photo_file_size 
    remove_column :archived_employees, :photo_file_name 
    remove_column :archived_employees, :photo_content_type 
    remove_column :archived_employees, :photo_data 
  end
  def self.down
    add_column :employees, :photo_file_size ,:integer
    add_column :employees, :photo_file_name , :string
    add_column :employees, :photo_content_type ,:string
    add_column :employees, :photo_data ,:binary
    add_column :archived_employees, :photo_file_size ,:integer
    add_column :archived_employees, :photo_file_name , :string
    add_column :archived_employees, :photo_content_type ,:string
    add_column :archived_employees, :photo_data ,:binary
  end

end
