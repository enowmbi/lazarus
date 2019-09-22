








# TODO: maybe add one for :has_and_belongs_to_many?
# TODO: Implement insertions for existing files... why??

require 'rails_helper'

RSpec.describe TimetableEntry, type: :model do
  it "should have a valid factory" do
    timetable_entry = FactoryGirl.build(:timetable_entry)
    expect(timetable_entry).to be_valid
  end

  describe "Validators" do

  	
  		
  			it "should ensure the presence of timetable" do
  				timetable_entry = FactoryGirl.build(:timetable_entry, timetable: nil)
  				expect(timetable_entry).not_to be_valid
  				expect(timetable_entry.errors[:timetable]).to be_present
  			end
  		
  	

  	
  end

  

	  describe "Associations" do
	  	
	  		it "should belong to a timetable" do
	  			timetable = FactoryGirl.create(:timetable)
	  			timetable_entry = FactoryGirl.build(:timetable_entry, timetable: timetable)
	  			expect(timetable_entry.timetable).to eq timetable
	  		end
	  	
	  		it "should belong to a batch" do
	  			batch = FactoryGirl.create(:batch)
	  			timetable_entry = FactoryGirl.build(:timetable_entry, batch: batch)
	  			expect(timetable_entry.batch).to eq batch
	  		end
	  	
	  		it "should belong to a class_timing" do
	  			class_timing = FactoryGirl.create(:class_timing)
	  			timetable_entry = FactoryGirl.build(:timetable_entry, class_timing: class_timing)
	  			expect(timetable_entry.class_timing).to eq class_timing
	  		end
	  	
	  		it "should belong to a subject" do
	  			subject = FactoryGirl.create(:subject)
	  			timetable_entry = FactoryGirl.build(:timetable_entry, subject: subject)
	  			expect(timetable_entry.subject).to eq subject
	  		end
	  	
	  		it "should belong to a employee" do
	  			employee = FactoryGirl.create(:employee)
	  			timetable_entry = FactoryGirl.build(:timetable_entry, employee: employee)
	  			expect(timetable_entry.employee).to eq employee
	  		end
	  	
	  		it "should belong to a weekday" do
	  			weekday = FactoryGirl.create(:weekday)
	  			timetable_entry = FactoryGirl.build(:timetable_entry, weekday: weekday)
	  			expect(timetable_entry.weekday).to eq weekday
	  		end
	  	

	  	
	  end
	

		

  describe "Behavior" do
  	pending "add some examples to #{__FILE__} for behaviours or delete the 'Behaviour' test there."
  end
end
