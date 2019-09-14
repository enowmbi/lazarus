FactoryBot.define do 
  factory :batch  do 
    course 
    name {"Batch"}
    start_date {3.months.before}
    end_date {1.months.after}
    is_active {true}
    is_deleted {true}
    employee
    grading_type {"CCE"}
  end

  factory :batch_1, :parent => :batch do 
    name {"Batch 1"}
    start_date {6.months.before}
    end_date {1.month.before}
    employee_1
  end

end
