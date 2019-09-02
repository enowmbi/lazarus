FactoryBot.define do 
  factory :ranking_level do 
    name{ "Level A" }
    gpa{ 4}
    marks{ 75}
    subject_count{ 1 }
    priority{ 1 }
    lower_limit{ false}
    full_course{ true}
  end
end
