class CceExamCategoriesExamGroup < ApplicationRecord
  belongs_to :cce_exam_category
  belongs_to :exam_group
end
