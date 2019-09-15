FactoryBot.define do 
  factory :employee_department do 
    sequence(:code){|n| "Fin_#{n}"}
    sequence(:name){|n| "Finance_#{n}"}
    status { true }
    # school_id {School.first.id}
  end
end
