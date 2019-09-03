FactoryBot.define do 
  factory :cce_report do 
    observable_id {1}
    observable_type {"Observation"}
    student
    batch
    grade_string {"A"}
    exam
  end
end
