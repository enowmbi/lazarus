








# TODO: maybe add one for :has_and_belongs_to_many?
# TODO: Implement insertions for existing files... why??

require 'rails_helper'

RSpec.describe FinanceFeeCategory, type: :model do
  it "should have a valid factory" do
    finance_fee_category = FactoryGirl.build(:finance_fee_category)
    expect(finance_fee_category).to be_valid
  end

  describe "Validators" do

  	
  		
  			it "should ensure the presence of batch" do
  				finance_fee_category = FactoryGirl.build(:finance_fee_category, batch: nil)
  				expect(finance_fee_category).not_to be_valid
  				expect(finance_fee_category.errors[:batch]).to be_present
  			end
  		
  	

  	
  		
  			
	  		
		  		it "should ensure the uniqueness of name" do
		      	finance_fee_category = FactoryGirl.create(:finance_fee_category)
						
							new_finance_fee_category = FactoryGirl.build(:finance_fee_category, name: finance_fee_category.name, [:batch_id, :is_deleted]: finance_fee_category.[:batch_id, :is_deleted])
						
		      	expect(new_finance_fee_category).not_to be_valid
		      	expect(new_finance_fee_category.errors[:name]).to be_present
		    	end
		    
		  
  	
  end

  

	  describe "Associations" do
	  	
	  		it "should belong to a batch" do
	  			batch = FactoryGirl.create(:batch)
	  			finance_fee_category = FactoryGirl.build(:finance_fee_category, batch: batch)
	  			expect(finance_fee_category.batch).to eq batch
	  		end
	  	
	  		it "should belong to a student" do
	  			student = FactoryGirl.create(:student)
	  			finance_fee_category = FactoryGirl.build(:finance_fee_category, student: student)
	  			expect(finance_fee_category.student).to eq student
	  		end
	  	

	  	
	  		it "should allow multiple fee_particulars" do
	  			finance_fee_category = FactoryGirl.create(:finance_fee_category)

	  			3.times.each do |n|
	  				fee_particular = FactoryGirl.create(:finance_fee_particular)
	  				finance_fee_category.fee_particulars << fee_particular
	  				finance_fee_category_fee_particulars = finance_fee_category.fee_particulars
	  				expect(finance_fee_category_fee_particulars.count).to eq n.next
	  				expect(finance_fee_category_fee_particulars).to include fee_particular
	  			end
	  		end

	  	
	  		it "should allow multiple fee_collections" do
	  			finance_fee_category = FactoryGirl.create(:finance_fee_category)

	  			3.times.each do |n|
	  				fee_collection = FactoryGirl.create(:finance_fee_collection)
	  				finance_fee_category.fee_collections << fee_collection
	  				finance_fee_category_fee_collections = finance_fee_category.fee_collections
	  				expect(finance_fee_category_fee_collections.count).to eq n.next
	  				expect(finance_fee_category_fee_collections).to include fee_collection
	  			end
	  		end

	  	
	  		it "should allow multiple fee_discounts" do
	  			finance_fee_category = FactoryGirl.create(:finance_fee_category)

	  			3.times.each do |n|
	  				fee_discount = FactoryGirl.create(:fee_discount)
	  				finance_fee_category.fee_discounts << fee_discount
	  				finance_fee_category_fee_discounts = finance_fee_category.fee_discounts
	  				expect(finance_fee_category_fee_discounts.count).to eq n.next
	  				expect(finance_fee_category_fee_discounts).to include fee_discount
	  			end
	  		end

	  	
	  end
	

	
		describe "Graceful Destroyal" do
			

			
				
				it "should destroy the associated fee_particulars when deleted" do
					finance_fee_category = FactoryGirl.create(:finance_fee_category)
					finance_fee_category.fee_particulars.create(FactoryGirl.attributes_for(:finance_fee_particular))

					expect{ finance_fee_category.destroy }.to change(FinanceFeeParticular, :count).by -1
				end
			
				
				it "should destroy the associated fee_collections when deleted" do
					finance_fee_category = FactoryGirl.create(:finance_fee_category)
					finance_fee_category.fee_collections.create(FactoryGirl.attributes_for(:finance_fee_collection))

					expect{ finance_fee_category.destroy }.to change(FinanceFeeCollection, :count).by -1
				end
			
				
				it "should destroy the associated fee_discounts when deleted" do
					finance_fee_category = FactoryGirl.create(:finance_fee_category)
					finance_fee_category.fee_discounts.create(FactoryGirl.attributes_for(:fee_discount))

					expect{ finance_fee_category.destroy }.to change(FeeDiscount, :count).by -1
				end
			
		end
		

  describe "Behavior" do
  	pending "add some examples to #{__FILE__} for behaviours or delete the 'Behaviour' test there."
  end
end
