class AddIsDeletedToCceTables < ActiveRecord::Migration[5.2]
	def change
		add_column  :observation_groups,  :is_deleted,  :boolean,:default=>false
		add_column  :fa_criterias,  :is_deleted,  :boolean,:default=>false
		add_column  :fa_groups,  :is_deleted,  :boolean,:default=>false
	end
end
