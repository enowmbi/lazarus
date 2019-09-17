class AddCceEnabledToCourse < ActiveRecord::Migration[5.2]
  def change
    add_column  :courses,:cce_enabled,:boolean
  end
end
