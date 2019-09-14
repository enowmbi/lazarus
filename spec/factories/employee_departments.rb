FactoryBot.define do 
  factory :employee_department do 
    code {"Fin"}
    name {"Finance"}
    status { true }
    # school_id {School.first.id}
  end
end
