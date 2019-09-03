FactoryBot.define do
	factory :employee_grade do
		name {"Senior"}
		priority {1}
		status { true }
		max_hours_day { 8 }
		max_hours_week {40 }
		school
	end
end
