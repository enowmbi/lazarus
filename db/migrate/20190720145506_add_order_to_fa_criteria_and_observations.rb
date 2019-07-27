class AddOrderToFaCriteriaAndObservations < ActiveRecord::Migration[5.2]
	def change
		add_column      :fa_criterias,    :sort_order,   :integer
		add_column      :observations,    :sort_order,   :integer
		add_column      :descriptive_indicators,    :sort_order,   :integer
	end
end
