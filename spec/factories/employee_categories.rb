FactoryBot.define do
	factory :employee_category do
		sequence(:name) {|n| "Lecturer_#{n} "}
		sequence(:prefix){|n| "Assistant_#{n}"}
		status { true }
		# school
	end
end
