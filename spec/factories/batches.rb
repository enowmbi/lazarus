FactoryBot.define do 
  factory :batch  do 
    course 
    sequence(:name){|n| "Batch_#{n}"}
    start_date {9.months.ago}
    end_date {3.months.from_now}
    is_active {true}
    is_deleted {true}
    employee
    grading_type {"CCE"}
  end

  factory :batch_1, :parent => :batch do 
    sequence(:name){|n| "Batch_1_#{n}"}
    start_date {6.months.ago}
    end_date {1.month.ago}
    employee_1
  end

end
