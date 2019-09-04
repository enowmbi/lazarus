FactoryBot.define do 
  factory :employee_salary_structure do 
    employee
    payroll_category
    amount {"100"}
    school
  end
end
