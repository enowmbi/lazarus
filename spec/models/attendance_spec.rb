








# TODO: maybe add one for :has_and_belongs_to_many?
# TODO: Implement insertions for existing files... why??

require 'rails_helper'

RSpec.describe Attendance, type: :model do
  it "should have a valid factory" do
    attendance = FactoryGirl.build(:attendance)
    expect(attendance).to be_valid
  end

  describe "Validators" do

  	
  		
  			it "should ensure the presence of student" do
  				attendance = FactoryGirl.build(:attendance, student: nil)
  				expect(attendance).not_to be_valid
  				expect(attendance.errors[:student]).to be_present
  			end
  		
  	

  	
  		
  			
	  		
		  		it "should ensure the uniqueness of student_id" do
		      	attendance = FactoryGirl.create(:attendance)
						
							new_attendance = FactoryGirl.build(:attendance, student_id: attendance.student_id, [:month_date]: attendance.[:month_date])
						
		      	expect(new_attendance).not_to be_valid
		      	expect(new_attendance.errors[:student_id]).to be_present
		    	end
		    
		  
  	
  end

  

	  describe "Associations" do
	  	
	  		it "should belong to a student" do
	  			student = FactoryGirl.create(:student)
	  			attendance = FactoryGirl.build(:attendance, student: student)
	  			expect(attendance.student).to eq student
	  		end
	  	
	  		it "should belong to a batch" do
	  			batch = FactoryGirl.create(:batch)
	  			attendance = FactoryGirl.build(:attendance, batch: batch)
	  			expect(attendance.batch).to eq batch
	  		end
	  	

	  	
	  end
	

		

  describe "Behavior" do
  	pending "add some examples to #{__FILE__} for behaviours or delete the 'Behaviour' test there."
  end
end
