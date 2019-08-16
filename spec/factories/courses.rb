FactoryBot.define do
  factory :course do 
    course_name {"Banking and Finance"}
    code {"BF"}
    section_name {"2019"}
    is_deleted {false}
    grading_type {"CCE"}
    batch 
  end

  factory :course_1, :parent => :course do 
    course_name {"Sociology"}
    code {"SO"}
    batch_1
  end
end

