








# TODO: maybe add one for :has_and_belongs_to_many?
# TODO: Implement insertions for existing files... why??

require 'rails_helper'

RSpec.describe Subject, type: :model do
  it "should have a valid factory" do
    subject = FactoryGirl.build(:subject)
    expect(subject).to be_valid
  end

  describe "Validators" do

  	
  		
  			it "should ensure the presence of batch" do
  				subject = FactoryGirl.build(:subject, batch: nil)
  				expect(subject).not_to be_valid
  				expect(subject.errors[:batch]).to be_present
  			end
  		
  	

  	
  		
  			
	  		
		  		it "should ensure the uniqueness of code" do
		      	subject = FactoryGirl.create(:subject)
						
							new_subject = FactoryGirl.build(:subject, code: subject.code, [:batch_id, :is_deleted]: subject.[:batch_id, :is_deleted])
						
		      	expect(new_subject).not_to be_valid
		      	expect(new_subject.errors[:code]).to be_present
		    	end
		    
		  
  	
  end

  

	  describe "Associations" do
	  	
	  		it "should belong to a batch" do
	  			batch = FactoryGirl.create(:batch)
	  			subject = FactoryGirl.build(:subject, batch: batch)
	  			expect(subject.batch).to eq batch
	  		end
	  	
	  		it "should belong to a elective_group" do
	  			elective_group = FactoryGirl.create(:elective_group)
	  			subject = FactoryGirl.build(:subject, elective_group: elective_group)
	  			expect(subject.elective_group).to eq elective_group
	  		end
	  	

	  	
	  		it "should allow multiple timetable_entries" do
	  			subject = FactoryGirl.create(:subject)

	  			3.times.each do |n|
	  				timetable_entry = FactoryGirl.create(:timetable_entry)
	  				subject.timetable_entries << timetable_entry
	  				subject_timetable_entries = subject.timetable_entries
	  				expect(subject_timetable_entries.count).to eq n.next
	  				expect(subject_timetable_entries).to include timetable_entry
	  			end
	  		end

	  	
	  		it "should allow multiple employees_subjects" do
	  			subject = FactoryGirl.create(:subject)

	  			3.times.each do |n|
	  				employees_subject = FactoryGirl.create(:employees_subject)
	  				subject.employees_subjects << employees_subject
	  				subject_employees_subjects = subject.employees_subjects
	  				expect(subject_employees_subjects.count).to eq n.next
	  				expect(subject_employees_subjects).to include employees_subject
	  			end
	  		end

	  	
	  		it "should allow multiple employees" do
	  			subject = FactoryGirl.create(:subject)

	  			3.times.each do |n|
	  				employee = FactoryGirl.create(:employee)
	  				subject.employees << employee
	  				subject_employees = subject.employees
	  				expect(subject_employees.count).to eq n.next
	  				expect(subject_employees).to include employee
	  			end
	  		end

	  	
	  		it "should allow multiple students_subjects" do
	  			subject = FactoryGirl.create(:subject)

	  			3.times.each do |n|
	  				students_subject = FactoryGirl.create(:students_subject)
	  				subject.students_subjects << students_subject
	  				subject_students_subjects = subject.students_subjects
	  				expect(subject_students_subjects.count).to eq n.next
	  				expect(subject_students_subjects).to include students_subject
	  			end
	  		end

	  	
	  		it "should allow multiple students" do
	  			subject = FactoryGirl.create(:subject)

	  			3.times.each do |n|
	  				student = FactoryGirl.create(:student)
	  				subject.students << student
	  				subject_students = subject.students
	  				expect(subject_students.count).to eq n.next
	  				expect(subject_students).to include student
	  			end
	  		end

	  	
	  		it "should allow multiple grouped_exam_reports" do
	  			subject = FactoryGirl.create(:subject)

	  			3.times.each do |n|
	  				grouped_exam_report = FactoryGirl.create(:grouped_exam_report)
	  				subject.grouped_exam_reports << grouped_exam_report
	  				subject_grouped_exam_reports = subject.grouped_exam_reports
	  				expect(subject_grouped_exam_reports.count).to eq n.next
	  				expect(subject_grouped_exam_reports).to include grouped_exam_report
	  			end
	  		end

	  	
	  end
	

	
		describe "Graceful Destroyal" do
			

			
				
				it "should destroy the associated timetable_entries when deleted" do
					subject = FactoryGirl.create(:subject)
					subject.timetable_entries.create(FactoryGirl.attributes_for(:timetable_entry))

					expect{ subject.destroy }.to change(TimetableEntry, :count).by -1
				end
			
				
				it "should destroy the associated employees_subjects when deleted" do
					subject = FactoryGirl.create(:subject)
					subject.employees_subjects.create(FactoryGirl.attributes_for(:employees_subject))

					expect{ subject.destroy }.to change(EmployeesSubject, :count).by -1
				end
			
				
				
				it "should destroy the associated students_subjects when deleted" do
					subject = FactoryGirl.create(:subject)
					subject.students_subjects.create(FactoryGirl.attributes_for(:students_subject))

					expect{ subject.destroy }.to change(StudentsSubject, :count).by -1
				end
			
				
				
				it "should destroy the associated grouped_exam_reports when deleted" do
					subject = FactoryGirl.create(:subject)
					subject.grouped_exam_reports.create(FactoryGirl.attributes_for(:grouped_exam_report))

					expect{ subject.destroy }.to change(GroupedExamReport, :count).by -1
				end
			
		end
		

  describe "Behavior" do
  	pending "add some examples to #{__FILE__} for behaviours or delete the 'Behaviour' test there."
  end
end
