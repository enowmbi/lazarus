FactoryBot.define do 
 factory :batch_fee_discount do 
 type {" Tuition" }
 name {"Tuition" }
 batch
 finance_fee_category
 discount {1000}
 is_amount {true}
 school
end
end
