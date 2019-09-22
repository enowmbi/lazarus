








# TODO: maybe add one for :has_and_belongs_to_many?
# TODO: Implement insertions for existing files... why??

require 'rails_helper'

RSpec.describe ElectiveGroup, type: :model do
  it "should have a valid factory" do
    elective_group = FactoryGirl.build(:elective_group)
    expect(elective_group).to be_valid
  end

  describe "Validators" do

  	
  		
  			it "should ensure the presence of batch" do
  				elective_group = FactoryGirl.build(:elective_group, batch: nil)
  				expect(elective_group).not_to be_valid
  				expect(elective_group.errors[:batch]).to be_present
  			end
  		
  	

  	
  end

  

	  describe "Associations" do
	  	
	  		it "should belong to a batch" do
	  			batch = FactoryGirl.create(:batch)
	  			elective_group = FactoryGirl.build(:elective_group, batch: batch)
	  			expect(elective_group.batch).to eq batch
	  		end
	  	

	  	
	  		it "should allow multiple subjects" do
	  			elective_group = FactoryGirl.create(:elective_group)

	  			3.times.each do |n|
	  				subject = FactoryGirl.create(:subject)
	  				elective_group.subjects << subject
	  				elective_group_subjects = elective_group.subjects
	  				expect(elective_group_subjects.count).to eq n.next
	  				expect(elective_group_subjects).to include subject
	  			end
	  		end

	  	
	  end
	

	
		describe "Graceful Destroyal" do
			

			
				
				it "should destroy the associated subjects when deleted" do
					elective_group = FactoryGirl.create(:elective_group)
					elective_group.subjects.create(FactoryGirl.attributes_for(:subject))

					expect{ elective_group.destroy }.to change(Subject, :count).by -1
				end
			
		end
		

  describe "Behavior" do
  	pending "add some examples to #{__FILE__} for behaviours or delete the 'Behaviour' test there."
  end
end
