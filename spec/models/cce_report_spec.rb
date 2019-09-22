








# TODO: maybe add one for :has_and_belongs_to_many?
# TODO: Implement insertions for existing files... why??

require 'rails_helper'

RSpec.describe CceReport, type: :model do
  it "should have a valid factory" do
    cce_report = FactoryGirl.build(:cce_report)
    expect(cce_report).to be_valid
  end

  describe "Validators" do

  	
  		
  			it "should ensure the presence of batch" do
  				cce_report = FactoryGirl.build(:cce_report, batch: nil)
  				expect(cce_report).not_to be_valid
  				expect(cce_report.errors[:batch]).to be_present
  			end
  		
  	

  	
  end

  

	  describe "Associations" do
	  	
	  		it "should belong to a batch" do
	  			batch = FactoryGirl.create(:batch)
	  			cce_report = FactoryGirl.build(:cce_report, batch: batch)
	  			expect(cce_report.batch).to eq batch
	  		end
	  	
	  		it "should belong to a student" do
	  			student = FactoryGirl.create(:student)
	  			cce_report = FactoryGirl.build(:cce_report, student: student)
	  			expect(cce_report.student).to eq student
	  		end
	  	
	  		it "should belong to a observable" do
	  			observable = FactoryGirl.create(:observable)
	  			cce_report = FactoryGirl.build(:cce_report, observable: observable)
	  			expect(cce_report.observable).to eq observable
	  		end
	  	
	  		it "should belong to a exam" do
	  			exam = FactoryGirl.create(:exam)
	  			cce_report = FactoryGirl.build(:cce_report, exam: exam)
	  			expect(cce_report.exam).to eq exam
	  		end
	  	

	  	
	  end
	

		

  describe "Behavior" do
  	pending "add some examples to #{__FILE__} for behaviours or delete the 'Behaviour' test there."
  end
end
