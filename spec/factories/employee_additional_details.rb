FactoryBot.define do 
  factory :employee_additional_detail do 
    employee
    additional_field
    additional_info {" Strengths"}
    # school
  end
end

