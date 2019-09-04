FactoryBot.define do 
  factory :subject do 
    name {"Accounting" }
    code {"ACC-201"}
    batch
    no_exams { false }
    max_weekly_classes { 3}
    elective_group
    is_deleted {false}
    school
    language { true }
    credit_hours {70}
    prefer_consecutive { false }
    amount { 100 }
  end
end
