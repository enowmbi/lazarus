








# TODO: maybe add one for :has_and_belongs_to_many?
# TODO: Implement insertions for existing files... why??

require 'rails_helper'

RSpec.describe BatchFeeDiscount, type: :model do
  it "should have a valid factory" do
    batch_fee_discount = FactoryGirl.build(:batch_fee_discount)
    expect(batch_fee_discount).to be_valid
  end

  describe "Validators" do

  	
  		
  			it "should ensure the presence of finance_fee_category" do
  				batch_fee_discount = FactoryGirl.build(:batch_fee_discount, finance_fee_category: nil)
  				expect(batch_fee_discount).not_to be_valid
  				expect(batch_fee_discount.errors[:finance_fee_category]).to be_present
  			end
  		
  	

  	
  		
  			
	  		
		  		it "should ensure the uniqueness of name" do
		      	batch_fee_discount = FactoryGirl.create(:batch_fee_discount)
						
							new_batch_fee_discount = FactoryGirl.build(:batch_fee_discount, name: batch_fee_discount.name, [:receiver_id, :type]: batch_fee_discount.[:receiver_id, :type])
						
		      	expect(new_batch_fee_discount).not_to be_valid
		      	expect(new_batch_fee_discount.errors[:name]).to be_present
		    	end
		    
		  
  	
  end

  

	  describe "Associations" do
	  	
	  		it "should belong to a finance_fee_category" do
	  			finance_fee_category = FactoryGirl.create(:finance_fee_category)
	  			batch_fee_discount = FactoryGirl.build(:batch_fee_discount, finance_fee_category: finance_fee_category)
	  			expect(batch_fee_discount.finance_fee_category).to eq finance_fee_category
	  		end
	  	
	  		it "should belong to a receiver" do
	  			receiver = FactoryGirl.create(:receiver)
	  			batch_fee_discount = FactoryGirl.build(:batch_fee_discount, receiver: receiver)
	  			expect(batch_fee_discount.receiver).to eq receiver
	  		end
	  	

	  	
	  end
	

		

  describe "Behavior" do
  	pending "add some examples to #{__FILE__} for behaviours or delete the 'Behaviour' test there."
  end
end
