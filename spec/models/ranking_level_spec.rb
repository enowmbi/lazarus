








# TODO: maybe add one for :has_and_belongs_to_many?
# TODO: Implement insertions for existing files... why??

require 'rails_helper'

RSpec.describe RankingLevel, type: :model do
  it "should have a valid factory" do
    ranking_level = FactoryGirl.build(:ranking_level)
    expect(ranking_level).to be_valid
  end

  describe "Validators" do

  	
  		
  			it "should ensure the presence of name" do
  				ranking_level = FactoryGirl.build(:ranking_level, name: nil)
  				expect(ranking_level).not_to be_valid
  				expect(ranking_level.errors[:name]).to be_present
  			end
  		
  	

  	
  end

  

	  describe "Associations" do
	  	
	  		it "should belong to a course" do
	  			course = FactoryGirl.create(:course)
	  			ranking_level = FactoryGirl.build(:ranking_level, course: course)
	  			expect(ranking_level.course).to eq course
	  		end
	  	

	  	
	  end
	

		

  describe "Behavior" do
  	pending "add some examples to #{__FILE__} for behaviours or delete the 'Behaviour' test there."
  end
end
