FactoryBot.define do 
  factory :grouped_exam_report do 
    batch
    student
    exam_group
    marks { 100 }
    score_type {"CCE"}
    subject
  end
end

