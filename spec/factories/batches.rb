FactoryBot.define do 
  factory :batch  do 
    course 
    name {"Batch"}
    start_date {2019-01-01}
    end_date {2019-07-31}
    is_active {true}
    is_deleted {true}
    employee
    grading_type {"CCE"}
  end

  factory :batch_1, :parent => :batch do 
    name {"Batch 1"}
    start_date {2019-03-01}
    end_date {2019-06-30}
    employee_1
  end

end
