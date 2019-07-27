#Fedena
#Copyright 2011 Foradian Technologies Private Limited
#
#This product includes software developed at
#Project Fedena - http://www.projectfedena.org/
#
#Licensed under the Apache License, Version 2.0 (the "License");
#you may not use this file except in compliance with the License.
#You may obtain a copy of the License at
#
#  http://www.apache.org/licenses/LICENSE-2.0
#
#Unless required by applicable law or agreed to in writing, software
#distributed under the License is distributed on an "AS IS" BASIS,
#WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#See the License for the specific language governing permissions and
#limitations under the License.
class SchoolDetail < ApplicationRecord
  has_one_attached :logo

validate :image_type
  VALID_IMAGE_TYPES = ['image/gif', 'image/png','image/jpeg', 'image/jpg']

  def original
    return self.logo.variant(:resize => '150x110').processed
  end

  private
  def image_type
    if logo.attached? 
      if !logo.content_type.in?(VALID_IMAGE_TYPES)
        errors.add(:logo, " can only be a #{VALID_IMAGE_TYPES.to_sentence(:last_word_connector =>' or ')}")
      end
      if logo.byte_size > 512000
        errors.add(:logo,"must be less than 500KB")
      end
    end
  end
end
