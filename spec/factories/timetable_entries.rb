FactoryBot.define do 
  factory :timetable_entries do 
    batch
    weekday
    class_timing
    subject
    employee
    school
    timetable
  end
end
