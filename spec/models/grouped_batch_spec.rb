








# TODO: maybe add one for :has_and_belongs_to_many?
# TODO: Implement insertions for existing files... why??

require 'rails_helper'

RSpec.describe GroupedBatch, type: :model do
  it "should have a valid factory" do
    grouped_batch = FactoryGirl.build(:grouped_batch)
    expect(grouped_batch).to be_valid
  end

  describe "Validators" do

  	
  		
  			it "should ensure the presence of batch_group" do
  				grouped_batch = FactoryGirl.build(:grouped_batch, batch_group: nil)
  				expect(grouped_batch).not_to be_valid
  				expect(grouped_batch.errors[:batch_group]).to be_present
  			end
  		
  	

  	
  end

  

	  describe "Associations" do
	  	
	  		it "should belong to a batch_group" do
	  			batch_group = FactoryGirl.create(:batch_group)
	  			grouped_batch = FactoryGirl.build(:grouped_batch, batch_group: batch_group)
	  			expect(grouped_batch.batch_group).to eq batch_group
	  		end
	  	
	  		it "should belong to a batch" do
	  			batch = FactoryGirl.create(:batch)
	  			grouped_batch = FactoryGirl.build(:grouped_batch, batch: batch)
	  			expect(grouped_batch.batch).to eq batch
	  		end
	  	

	  	
	  end
	

		

  describe "Behavior" do
  	pending "add some examples to #{__FILE__} for behaviours or delete the 'Behaviour' test there."
  end
end
