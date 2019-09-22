








# TODO: maybe add one for :has_and_belongs_to_many?
# TODO: Implement insertions for existing files... why??

require 'rails_helper'

RSpec.describe GradingLevel, type: :model do
  it "should have a valid factory" do
    grading_level = FactoryGirl.build(:grading_level)
    expect(grading_level).to be_valid
  end

  describe "Validators" do

  	
  		
  			it "should ensure the presence of batch" do
  				grading_level = FactoryGirl.build(:grading_level, batch: nil)
  				expect(grading_level).not_to be_valid
  				expect(grading_level.errors[:batch]).to be_present
  			end
  		
  	

  	
  		
  			
	  		
		  		it "should ensure the uniqueness of name" do
		      	grading_level = FactoryGirl.create(:grading_level)
						
							new_grading_level = FactoryGirl.build(:grading_level, name: grading_level.name, [:batch_id, :is_deleted]: grading_level.[:batch_id, :is_deleted])
						
		      	expect(new_grading_level).not_to be_valid
		      	expect(new_grading_level.errors[:name]).to be_present
		    	end
		    
		  
  	
  end

  

	  describe "Associations" do
	  	
	  		it "should belong to a batch" do
	  			batch = FactoryGirl.create(:batch)
	  			grading_level = FactoryGirl.build(:grading_level, batch: batch)
	  			expect(grading_level.batch).to eq batch
	  		end
	  	

	  	
	  end
	

		

  describe "Behavior" do
  	pending "add some examples to #{__FILE__} for behaviours or delete the 'Behaviour' test there."
  end
end
