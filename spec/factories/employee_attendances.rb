FactoryBot.define do 
  factory :employee_attendance do 
    attendance_date {Time.now}
    employee
    employee_leave_type
    reason {"Regular hours"}
    is_half_day{false}
    school
  end
end
