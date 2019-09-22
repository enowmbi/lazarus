








# TODO: maybe add one for :has_and_belongs_to_many?
# TODO: Implement insertions for existing files... why??

require 'rails_helper'

RSpec.describe ExamGroup, type: :model do
  it "should have a valid factory" do
    exam_group = FactoryGirl.build(:exam_group)
    expect(exam_group).to be_valid
  end

  describe "Validators" do

  	
  		
  			it "should ensure the presence of name" do
  				exam_group = FactoryGirl.build(:exam_group, name: nil)
  				expect(exam_group).not_to be_valid
  				expect(exam_group.errors[:name]).to be_present
  			end
  		
  	

  	
  		
  			
	  		
		  		it "should ensure the uniqueness of cce_exam_category_id" do
		      	exam_group = FactoryGirl.create(:exam_group)
						
							new_exam_group = FactoryGirl.build(:exam_group, cce_exam_category_id: exam_group.cce_exam_category_id, batch_id: exam_group.batch_id)
						
		      	expect(new_exam_group).not_to be_valid
		      	expect(new_exam_group.errors[:cce_exam_category_id]).to be_present
		    	end
		    
		  
  	
  end

  

	  describe "Associations" do
	  	
	  		it "should belong to a batch" do
	  			batch = FactoryGirl.create(:batch)
	  			exam_group = FactoryGirl.build(:exam_group, batch: batch)
	  			expect(exam_group.batch).to eq batch
	  		end
	  	
	  		it "should belong to a grouped_exam" do
	  			grouped_exam = FactoryGirl.create(:grouped_exam)
	  			exam_group = FactoryGirl.build(:exam_group, grouped_exam: grouped_exam)
	  			expect(exam_group.grouped_exam).to eq grouped_exam
	  		end
	  	

	  	
	  		it "should allow multiple exams" do
	  			exam_group = FactoryGirl.create(:exam_group)

	  			3.times.each do |n|
	  				exam = FactoryGirl.create(:exam)
	  				exam_group.exams << exam
	  				exam_group_exams = exam_group.exams
	  				expect(exam_group_exams.count).to eq n.next
	  				expect(exam_group_exams).to include exam
	  			end
	  		end

	  	
	  		it "should allow multiple cce_exam_categories_exam_groups" do
	  			exam_group = FactoryGirl.create(:exam_group)

	  			3.times.each do |n|
	  				cce_exam_categories_exam_group = FactoryGirl.create(:cce_exam_categories_exam_group)
	  				exam_group.cce_exam_categories_exam_groups << cce_exam_categories_exam_group
	  				exam_group_cce_exam_categories_exam_groups = exam_group.cce_exam_categories_exam_groups
	  				expect(exam_group_cce_exam_categories_exam_groups.count).to eq n.next
	  				expect(exam_group_cce_exam_categories_exam_groups).to include cce_exam_categories_exam_group
	  			end
	  		end

	  	
	  		it "should allow multiple cce_exam_categories" do
	  			exam_group = FactoryGirl.create(:exam_group)

	  			3.times.each do |n|
	  				cce_exam_category = FactoryGirl.create(:cce_exam_category)
	  				exam_group.cce_exam_categories << cce_exam_category
	  				exam_group_cce_exam_categories = exam_group.cce_exam_categories
	  				expect(exam_group_cce_exam_categories.count).to eq n.next
	  				expect(exam_group_cce_exam_categories).to include cce_exam_category
	  			end
	  		end

	  	
	  end
	

	
		describe "Graceful Destroyal" do
			

			
				
				it "should destroy the associated exams when deleted" do
					exam_group = FactoryGirl.create(:exam_group)
					exam_group.exams.create(FactoryGirl.attributes_for(:exam))

					expect{ exam_group.destroy }.to change(Exam, :count).by -1
				end
			
				
				it "should destroy the associated cce_exam_categories_exam_groups when deleted" do
					exam_group = FactoryGirl.create(:exam_group)
					exam_group.cce_exam_categories_exam_groups.create(FactoryGirl.attributes_for(:cce_exam_categories_exam_group))

					expect{ exam_group.destroy }.to change(CceExamCategoriesExamGroup, :count).by -1
				end
			
				
		end
		

  describe "Behavior" do
  	pending "add some examples to #{__FILE__} for behaviours or delete the 'Behaviour' test there."
  end
end
