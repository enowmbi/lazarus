








# TODO: maybe add one for :has_and_belongs_to_many?
# TODO: Implement insertions for existing files... why??

require 'rails_helper'

RSpec.describe FinanceFeeCollection, type: :model do
  it "should have a valid factory" do
    finance_fee_collection = FactoryGirl.build(:finance_fee_collection)
    expect(finance_fee_collection).to be_valid
  end

  describe "Validators" do

  	
  		
  			it "should ensure the presence of batch" do
  				finance_fee_collection = FactoryGirl.build(:finance_fee_collection, batch: nil)
  				expect(finance_fee_collection).not_to be_valid
  				expect(finance_fee_collection.errors[:batch]).to be_present
  			end
  		
  	

  	
  end

  

	  describe "Associations" do
	  	
	  		it "should belong to a batch" do
	  			batch = FactoryGirl.create(:batch)
	  			finance_fee_collection = FactoryGirl.build(:finance_fee_collection, batch: batch)
	  			expect(finance_fee_collection.batch).to eq batch
	  		end
	  	
	  		it "should belong to a fee_category" do
	  			fee_category = FactoryGirl.create(:fee_category)
	  			finance_fee_collection = FactoryGirl.build(:finance_fee_collection, fee_category: fee_category)
	  			expect(finance_fee_collection.fee_category).to eq fee_category
	  		end
	  	

	  	
	  		it "should allow multiple finance_fees" do
	  			finance_fee_collection = FactoryGirl.create(:finance_fee_collection)

	  			3.times.each do |n|
	  				finance_fee = FactoryGirl.create(:finance_fee)
	  				finance_fee_collection.finance_fees << finance_fee
	  				finance_fee_collection_finance_fees = finance_fee_collection.finance_fees
	  				expect(finance_fee_collection_finance_fees.count).to eq n.next
	  				expect(finance_fee_collection_finance_fees).to include finance_fee
	  			end
	  		end

	  	
	  		it "should allow multiple finance_transactions" do
	  			finance_fee_collection = FactoryGirl.create(:finance_fee_collection)

	  			3.times.each do |n|
	  				finance_transaction = FactoryGirl.create(:finance_transaction)
	  				finance_fee_collection.finance_transactions << finance_transaction
	  				finance_fee_collection_finance_transactions = finance_fee_collection.finance_transactions
	  				expect(finance_fee_collection_finance_transactions.count).to eq n.next
	  				expect(finance_fee_collection_finance_transactions).to include finance_transaction
	  			end
	  		end

	  	
	  		it "should allow multiple students" do
	  			finance_fee_collection = FactoryGirl.create(:finance_fee_collection)

	  			3.times.each do |n|
	  				student = FactoryGirl.create(:student)
	  				finance_fee_collection.students << student
	  				finance_fee_collection_students = finance_fee_collection.students
	  				expect(finance_fee_collection_students.count).to eq n.next
	  				expect(finance_fee_collection_students).to include student
	  			end
	  		end

	  	
	  		it "should allow multiple fee_collection_particulars" do
	  			finance_fee_collection = FactoryGirl.create(:finance_fee_collection)

	  			3.times.each do |n|
	  				fee_collection_particular = FactoryGirl.create(:fee_collection_particular)
	  				finance_fee_collection.fee_collection_particulars << fee_collection_particular
	  				finance_fee_collection_fee_collection_particulars = finance_fee_collection.fee_collection_particulars
	  				expect(finance_fee_collection_fee_collection_particulars.count).to eq n.next
	  				expect(finance_fee_collection_fee_collection_particulars).to include fee_collection_particular
	  			end
	  		end

	  	
	  		it "should allow multiple fee_collection_discounts" do
	  			finance_fee_collection = FactoryGirl.create(:finance_fee_collection)

	  			3.times.each do |n|
	  				fee_collection_discount = FactoryGirl.create(:fee_collection_discount)
	  				finance_fee_collection.fee_collection_discounts << fee_collection_discount
	  				finance_fee_collection_fee_collection_discounts = finance_fee_collection.fee_collection_discounts
	  				expect(finance_fee_collection_fee_collection_discounts.count).to eq n.next
	  				expect(finance_fee_collection_fee_collection_discounts).to include fee_collection_discount
	  			end
	  		end

	  	
	  end
	

	
		describe "Graceful Destroyal" do
			
				
				it "should destroy the associated event when deleted" do
					finance_fee_collection = FactoryGirl.create(:finance_fee_collection)
					event = FactoryGirl.create(:event)
					finance_fee_collection.events << event

					expect{ finance_fee_collection.destroy }.to change(Event, :count).by -1
				end
			

			
				
				it "should destroy the associated finance_fees when deleted" do
					finance_fee_collection = FactoryGirl.create(:finance_fee_collection)
					finance_fee_collection.finance_fees.create(FactoryGirl.attributes_for(:finance_fee))

					expect{ finance_fee_collection.destroy }.to change(FinanceFee, :count).by -1
				end
			
				
				
				
				it "should destroy the associated fee_collection_particulars when deleted" do
					finance_fee_collection = FactoryGirl.create(:finance_fee_collection)
					finance_fee_collection.fee_collection_particulars.create(FactoryGirl.attributes_for(:fee_collection_particular))

					expect{ finance_fee_collection.destroy }.to change(FeeCollectionParticular, :count).by -1
				end
			
				
				it "should destroy the associated fee_collection_discounts when deleted" do
					finance_fee_collection = FactoryGirl.create(:finance_fee_collection)
					finance_fee_collection.fee_collection_discounts.create(FactoryGirl.attributes_for(:fee_collection_discount))

					expect{ finance_fee_collection.destroy }.to change(FeeCollectionDiscount, :count).by -1
				end
			
		end
		

  describe "Behavior" do
  	pending "add some examples to #{__FILE__} for behaviours or delete the 'Behaviour' test there."
  end
end
