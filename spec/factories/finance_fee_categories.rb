FactoryBot.define do 
  factory :finance_fee_category do 
    name {"Tuition"}
    description {"Tuition Description" }
    batch
    is_deleted {false }
    is_master { true }
    school
  end
end
