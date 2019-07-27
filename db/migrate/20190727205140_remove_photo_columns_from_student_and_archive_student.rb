class RemovePhotoColumnsFromStudentAndArchiveStudent < ActiveRecord::Migration[5.2]
  def self.up
    remove_column :students, :photo_file_size 
    remove_column :students, :photo_file_name 
    remove_column :students, :photo_content_type 
    remove_column :students, :photo_data 
    remove_column :archived_students, :photo_file_size 
    remove_column :archived_students, :photo_file_name 
    remove_column :archived_students, :photo_content_type 
    remove_column :archived_students, :photo_data 
  end
  def self.down
    add_column :students, :photo_file_size ,:integer
    add_column :students, :photo_file_name , :string
    add_column :students, :photo_content_type ,:string
    add_column :students, :photo_data ,:binary
    add_column :archived_students, :photo_file_size ,:integer
    add_column :archived_students, :photo_file_name , :string
    add_column :archived_students, :photo_content_type ,:string
    add_column :archived_students, :photo_data ,:binary
  end
end
