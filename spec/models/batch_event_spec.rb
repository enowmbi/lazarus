








# TODO: maybe add one for :has_and_belongs_to_many?
# TODO: Implement insertions for existing files... why??

require 'rails_helper'

RSpec.describe BatchEvent, type: :model do
  it "should have a valid factory" do
    batch_event = FactoryGirl.build(:batch_event)
    expect(batch_event).to be_valid
  end

  describe "Validators" do

  	
  		
  			it "should ensure the presence of batch" do
  				batch_event = FactoryGirl.build(:batch_event, batch: nil)
  				expect(batch_event).not_to be_valid
  				expect(batch_event.errors[:batch]).to be_present
  			end
  		
  	

  	
  end

  

	  describe "Associations" do
	  	
	  		it "should belong to a batch" do
	  			batch = FactoryGirl.create(:batch)
	  			batch_event = FactoryGirl.build(:batch_event, batch: batch)
	  			expect(batch_event.batch).to eq batch
	  		end
	  	
	  		it "should belong to a event" do
	  			event = FactoryGirl.create(:event)
	  			batch_event = FactoryGirl.build(:batch_event, event: event)
	  			expect(batch_event.event).to eq event
	  		end
	  	

	  	
	  end
	

		

  describe "Behavior" do
  	pending "add some examples to #{__FILE__} for behaviours or delete the 'Behaviour' test there."
  end
end
