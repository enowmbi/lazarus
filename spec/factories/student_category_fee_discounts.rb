FactoryBot.define do 
  factory :student_category_fee_discount do 
    type {"Tuition"}
    name {"Tuition"}
    student
    finance_fee_category
    discount {1000}
    is_amount { true }
    school
  end
end
