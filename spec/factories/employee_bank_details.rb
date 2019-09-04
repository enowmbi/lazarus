FactoryBot.define do 
  factory :employee_bank_details do 
    employee
    bank_field
    bank_info {"Atlantic Bank"}
    school
  end
end
