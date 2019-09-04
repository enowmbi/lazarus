FactoryBot.define do 
  factory :apply_leaves do 
    employee
    employee_leave_type
    is_half_day { false }
    start_date {Time.now }
    end_date { Time.now }
    reason {"Visit to my family"}
    approved { true }
    viewed_by_manager { true }
    manager_remark {"granted"}
    school
  end
end
