FactoryBot.define do
  factory :weekday do 
    batch
    weekday {"Monday"}
    school
    name {"Monday "}
    sort_order{1}
    day_of_week {1}
    is_deleted {false}
  end
end
