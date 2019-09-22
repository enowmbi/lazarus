








# TODO: maybe add one for :has_and_belongs_to_many?
# TODO: Implement insertions for existing files... why??

require 'rails_helper'

RSpec.describe AssessmentScore, type: :model do
  it "should have a valid factory" do
    assessment_score = FactoryGirl.build(:assessment_score)
    expect(assessment_score).to be_valid
  end

  describe "Validators" do

  	
  		
  			it "should ensure the presence of student" do
  				assessment_score = FactoryGirl.build(:assessment_score, student: nil)
  				expect(assessment_score).not_to be_valid
  				expect(assessment_score.errors[:student]).to be_present
  			end
  		
  	

  	
  end

  

	  describe "Associations" do
	  	
	  		it "should belong to a student" do
	  			student = FactoryGirl.create(:student)
	  			assessment_score = FactoryGirl.build(:assessment_score, student: student)
	  			expect(assessment_score.student).to eq student
	  		end
	  	
	  		it "should belong to a descriptive_indicator" do
	  			descriptive_indicator = FactoryGirl.create(:descriptive_indicator)
	  			assessment_score = FactoryGirl.build(:assessment_score, descriptive_indicator: descriptive_indicator)
	  			expect(assessment_score.descriptive_indicator).to eq descriptive_indicator
	  		end
	  	
	  		it "should belong to a exam" do
	  			exam = FactoryGirl.create(:exam)
	  			assessment_score = FactoryGirl.build(:assessment_score, exam: exam)
	  			expect(assessment_score.exam).to eq exam
	  		end
	  	

	  	
	  end
	

		

  describe "Behavior" do
  	pending "add some examples to #{__FILE__} for behaviours or delete the 'Behaviour' test there."
  end
end
