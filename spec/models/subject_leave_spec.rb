








# TODO: maybe add one for :has_and_belongs_to_many?
# TODO: Implement insertions for existing files... why??

require 'rails_helper'

RSpec.describe SubjectLeave, type: :model do
  it "should have a valid factory" do
    subject_leave = FactoryGirl.build(:subject_leave)
    expect(subject_leave).to be_valid
  end

  describe "Validators" do

  	
  		
  			it "should ensure the presence of student" do
  				subject_leave = FactoryGirl.build(:subject_leave, student: nil)
  				expect(subject_leave).not_to be_valid
  				expect(subject_leave.errors[:student]).to be_present
  			end
  		
  	

  	
  		
  			
	  		
		  		it "should ensure the uniqueness of student_id" do
		      	subject_leave = FactoryGirl.create(:subject_leave)
						
							new_subject_leave = FactoryGirl.build(:subject_leave, student_id: subject_leave.student_id, [:class_timing_id, :month_date]: subject_leave.[:class_timing_id, :month_date])
						
		      	expect(new_subject_leave).not_to be_valid
		      	expect(new_subject_leave.errors[:student_id]).to be_present
		    	end
		    
		  
  	
  end

  

	  describe "Associations" do
	  	
	  		it "should belong to a student" do
	  			student = FactoryGirl.create(:student)
	  			subject_leave = FactoryGirl.build(:subject_leave, student: student)
	  			expect(subject_leave.student).to eq student
	  		end
	  	
	  		it "should belong to a batch" do
	  			batch = FactoryGirl.create(:batch)
	  			subject_leave = FactoryGirl.build(:subject_leave, batch: batch)
	  			expect(subject_leave.batch).to eq batch
	  		end
	  	
	  		it "should belong to a subject" do
	  			subject = FactoryGirl.create(:subject)
	  			subject_leave = FactoryGirl.build(:subject_leave, subject: subject)
	  			expect(subject_leave.subject).to eq subject
	  		end
	  	
	  		it "should belong to a employee" do
	  			employee = FactoryGirl.create(:employee)
	  			subject_leave = FactoryGirl.build(:subject_leave, employee: employee)
	  			expect(subject_leave.employee).to eq employee
	  		end
	  	
	  		it "should belong to a class_timing" do
	  			class_timing = FactoryGirl.create(:class_timing)
	  			subject_leave = FactoryGirl.build(:subject_leave, class_timing: class_timing)
	  			expect(subject_leave.class_timing).to eq class_timing
	  		end
	  	

	  	
	  end
	

		

  describe "Behavior" do
  	pending "add some examples to #{__FILE__} for behaviours or delete the 'Behaviour' test there."
  end
end
