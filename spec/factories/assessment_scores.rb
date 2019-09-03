FactoryBot.define do 
  factory :assessment_score do 
    student
    grade_points { 5}
    descriptive_indicator
    exam
    batch
  end
end
