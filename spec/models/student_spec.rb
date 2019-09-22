








# TODO: maybe add one for :has_and_belongs_to_many?
# TODO: Implement insertions for existing files... why??

require 'rails_helper'

RSpec.describe Student, type: :model do
  it "should have a valid factory" do
    student = FactoryGirl.build(:student)
    expect(student).to be_valid
  end

  describe "Validators" do

  	
  		
  			it "should ensure the presence of country" do
  				student = FactoryGirl.build(:student, country: nil)
  				expect(student).not_to be_valid
  				expect(student.errors[:country]).to be_present
  			end
  		
  	

  	
  		
  			
	  		
		  		it "should ensure the uniqueness of admission_no" do
		      	student = FactoryGirl.create(:student)
						
		      		new_student = FactoryGirl.build(:student, admission_no: student.admission_no)
		      	
		      	expect(new_student).not_to be_valid
		      	expect(new_student.errors[:admission_no]).to be_present
		    	end
		    
		  
  	
  end

  

	  describe "Associations" do
	  	
	  		it "should belong to a country" do
	  			country = FactoryGirl.create(:country)
	  			student = FactoryGirl.build(:student, country: country)
	  			expect(student.country).to eq country
	  		end
	  	
	  		it "should belong to a batch" do
	  			batch = FactoryGirl.create(:batch)
	  			student = FactoryGirl.build(:student, batch: batch)
	  			expect(student.batch).to eq batch
	  		end
	  	
	  		it "should belong to a student_category" do
	  			student_category = FactoryGirl.create(:student_category)
	  			student = FactoryGirl.build(:student, student_category: student_category)
	  			expect(student.student_category).to eq student_category
	  		end
	  	
	  		it "should belong to a nationality" do
	  			nationality = FactoryGirl.create(:nationality)
	  			student = FactoryGirl.build(:student, nationality: nationality)
	  			expect(student.nationality).to eq nationality
	  		end
	  	
	  		it "should belong to a user" do
	  			user = FactoryGirl.create(:user)
	  			student = FactoryGirl.build(:student, user: user)
	  			expect(student.user).to eq user
	  		end
	  	

	  	
	  		it "should allow multiple student_previous_subject_mark" do
	  			student = FactoryGirl.create(:student)

	  			3.times.each do |n|
	  				student_previous_subject_mark = FactoryGirl.create(:student_previous_subject_mark)
	  				student.student_previous_subject_mark << student_previous_subject_mark
	  				student_student_previous_subject_mark = student.student_previous_subject_mark
	  				expect(student_student_previous_subject_mark.count).to eq n.next
	  				expect(student_student_previous_subject_mark).to include student_previous_subject_mark
	  			end
	  		end

	  	
	  		it "should allow multiple guardians" do
	  			student = FactoryGirl.create(:student)

	  			3.times.each do |n|
	  				guardian = FactoryGirl.create(:guardian)
	  				student.guardians << guardian
	  				student_guardians = student.guardians
	  				expect(student_guardians.count).to eq n.next
	  				expect(student_guardians).to include guardian
	  			end
	  		end

	  	
	  		it "should allow multiple finance_transactions" do
	  			student = FactoryGirl.create(:student)

	  			3.times.each do |n|
	  				finance_transaction = FactoryGirl.create(:finance_transaction)
	  				student.finance_transactions << finance_transaction
	  				student_finance_transactions = student.finance_transactions
	  				expect(student_finance_transactions.count).to eq n.next
	  				expect(student_finance_transactions).to include finance_transaction
	  			end
	  		end

	  	
	  		it "should allow multiple attendances" do
	  			student = FactoryGirl.create(:student)

	  			3.times.each do |n|
	  				attendance = FactoryGirl.create(:attendance)
	  				student.attendances << attendance
	  				student_attendances = student.attendances
	  				expect(student_attendances.count).to eq n.next
	  				expect(student_attendances).to include attendance
	  			end
	  		end

	  	
	  		it "should allow multiple finance_fees" do
	  			student = FactoryGirl.create(:student)

	  			3.times.each do |n|
	  				finance_fee = FactoryGirl.create(:finance_fee)
	  				student.finance_fees << finance_fee
	  				student_finance_fees = student.finance_fees
	  				expect(student_finance_fees.count).to eq n.next
	  				expect(student_finance_fees).to include finance_fee
	  			end
	  		end

	  	
	  		it "should allow multiple fee_category" do
	  			student = FactoryGirl.create(:student)

	  			3.times.each do |n|
	  				fee_category = FactoryGirl.create(:finance_fee_category)
	  				student.fee_category << fee_category
	  				student_fee_category = student.fee_category
	  				expect(student_fee_category.count).to eq n.next
	  				expect(student_fee_category).to include fee_category
	  			end
	  		end

	  	
	  		it "should allow multiple students_subjects" do
	  			student = FactoryGirl.create(:student)

	  			3.times.each do |n|
	  				students_subject = FactoryGirl.create(:students_subject)
	  				student.students_subjects << students_subject
	  				student_students_subjects = student.students_subjects
	  				expect(student_students_subjects.count).to eq n.next
	  				expect(student_students_subjects).to include students_subject
	  			end
	  		end

	  	
	  		it "should allow multiple subjects" do
	  			student = FactoryGirl.create(:student)

	  			3.times.each do |n|
	  				subject = FactoryGirl.create(:subject)
	  				student.subjects << subject
	  				student_subjects = student.subjects
	  				expect(student_subjects.count).to eq n.next
	  				expect(student_subjects).to include subject
	  			end
	  		end

	  	
	  		it "should allow multiple student_additional_details" do
	  			student = FactoryGirl.create(:student)

	  			3.times.each do |n|
	  				student_additional_detail = FactoryGirl.create(:student_additional_detail)
	  				student.student_additional_details << student_additional_detail
	  				student_student_additional_details = student.student_additional_details
	  				expect(student_student_additional_details.count).to eq n.next
	  				expect(student_student_additional_details).to include student_additional_detail
	  			end
	  		end

	  	
	  		it "should allow multiple batch_students" do
	  			student = FactoryGirl.create(:student)

	  			3.times.each do |n|
	  				batch_student = FactoryGirl.create(:batch_student)
	  				student.batch_students << batch_student
	  				student_batch_students = student.batch_students
	  				expect(student_batch_students.count).to eq n.next
	  				expect(student_batch_students).to include batch_student
	  			end
	  		end

	  	
	  		it "should allow multiple subject_leaves" do
	  			student = FactoryGirl.create(:student)

	  			3.times.each do |n|
	  				subject_leave = FactoryGirl.create(:subject_leave)
	  				student.subject_leaves << subject_leave
	  				student_subject_leaves = student.subject_leaves
	  				expect(student_subject_leaves.count).to eq n.next
	  				expect(student_subject_leaves).to include subject_leave
	  			end
	  		end

	  	
	  		it "should allow multiple grouped_exam_reports" do
	  			student = FactoryGirl.create(:student)

	  			3.times.each do |n|
	  				grouped_exam_report = FactoryGirl.create(:grouped_exam_report)
	  				student.grouped_exam_reports << grouped_exam_report
	  				student_grouped_exam_reports = student.grouped_exam_reports
	  				expect(student_grouped_exam_reports.count).to eq n.next
	  				expect(student_grouped_exam_reports).to include grouped_exam_report
	  			end
	  		end

	  	
	  		it "should allow multiple cce_reports" do
	  			student = FactoryGirl.create(:student)

	  			3.times.each do |n|
	  				cce_report = FactoryGirl.create(:cce_report)
	  				student.cce_reports << cce_report
	  				student_cce_reports = student.cce_reports
	  				expect(student_cce_reports.count).to eq n.next
	  				expect(student_cce_reports).to include cce_report
	  			end
	  		end

	  	
	  		it "should allow multiple assessment_scores" do
	  			student = FactoryGirl.create(:student)

	  			3.times.each do |n|
	  				assessment_score = FactoryGirl.create(:assessment_score)
	  				student.assessment_scores << assessment_score
	  				student_assessment_scores = student.assessment_scores
	  				expect(student_assessment_scores.count).to eq n.next
	  				expect(student_assessment_scores).to include assessment_score
	  			end
	  		end

	  	
	  		it "should allow multiple exam_scores" do
	  			student = FactoryGirl.create(:student)

	  			3.times.each do |n|
	  				exam_score = FactoryGirl.create(:exam_score)
	  				student.exam_scores << exam_score
	  				student_exam_scores = student.exam_scores
	  				expect(student_exam_scores.count).to eq n.next
	  				expect(student_exam_scores).to include exam_score
	  			end
	  		end

	  	
	  		it "should allow multiple previous_exam_scores" do
	  			student = FactoryGirl.create(:student)

	  			3.times.each do |n|
	  				previous_exam_score = FactoryGirl.create(:previous_exam_score)
	  				student.previous_exam_scores << previous_exam_score
	  				student_previous_exam_scores = student.previous_exam_scores
	  				expect(student_previous_exam_scores.count).to eq n.next
	  				expect(student_previous_exam_scores).to include previous_exam_score
	  			end
	  		end

	  	
	  end
	

	
		describe "Graceful Destroyal" do
			
				
				it "should destroy the associated student_previous_data when deleted" do
					student = FactoryGirl.create(:student)
					student_previous_data = FactoryGirl.create(:student_previous_data)
					student.student_previous_datas << student_previous_data

					expect{ student.destroy }.to change(StudentPreviousData, :count).by -1
				end
			
				
				it "should destroy the associated photo_attachment when deleted" do
					student = FactoryGirl.create(:student)
					photo_attachment = FactoryGirl.create(:photo_attachment)
					student.photo_attachments << photo_attachment

					expect{ student.destroy }.to change(ActiveStorage::Attachment, :count).by -1
				end
			
				

			
				
				it "should destroy the associated student_previous_subject_mark when deleted" do
					student = FactoryGirl.create(:student)
					student.student_previous_subject_mark.create(FactoryGirl.attributes_for(:student_previous_subject_mark))

					expect{ student.destroy }.to change(StudentPreviousSubjectMark, :count).by -1
				end
			
				
				it "should destroy the associated guardians when deleted" do
					student = FactoryGirl.create(:student)
					student.guardians.create(FactoryGirl.attributes_for(:guardian))

					expect{ student.destroy }.to change(Guardian, :count).by -1
				end
			
				
				it "should destroy the associated finance_transactions when deleted" do
					student = FactoryGirl.create(:student)
					student.finance_transactions.create(FactoryGirl.attributes_for(:finance_transaction))

					expect{ student.destroy }.to change(FinanceTransaction, :count).by -1
				end
			
				
				it "should destroy the associated attendances when deleted" do
					student = FactoryGirl.create(:student)
					student.attendances.create(FactoryGirl.attributes_for(:attendance))

					expect{ student.destroy }.to change(Attendance, :count).by -1
				end
			
				
				it "should destroy the associated finance_fees when deleted" do
					student = FactoryGirl.create(:student)
					student.finance_fees.create(FactoryGirl.attributes_for(:finance_fee))

					expect{ student.destroy }.to change(FinanceFee, :count).by -1
				end
			
				
				it "should destroy the associated fee_category when deleted" do
					student = FactoryGirl.create(:student)
					student.fee_category.create(FactoryGirl.attributes_for(:finance_fee_category))

					expect{ student.destroy }.to change(FinanceFeeCategory, :count).by -1
				end
			
				
				it "should destroy the associated students_subjects when deleted" do
					student = FactoryGirl.create(:student)
					student.students_subjects.create(FactoryGirl.attributes_for(:students_subject))

					expect{ student.destroy }.to change(StudentsSubject, :count).by -1
				end
			
				
				
				it "should destroy the associated student_additional_details when deleted" do
					student = FactoryGirl.create(:student)
					student.student_additional_details.create(FactoryGirl.attributes_for(:student_additional_detail))

					expect{ student.destroy }.to change(StudentAdditionalDetail, :count).by -1
				end
			
				
				it "should destroy the associated batch_students when deleted" do
					student = FactoryGirl.create(:student)
					student.batch_students.create(FactoryGirl.attributes_for(:batch_student))

					expect{ student.destroy }.to change(BatchStudent, :count).by -1
				end
			
				
				it "should destroy the associated subject_leaves when deleted" do
					student = FactoryGirl.create(:student)
					student.subject_leaves.create(FactoryGirl.attributes_for(:subject_leave))

					expect{ student.destroy }.to change(SubjectLeave, :count).by -1
				end
			
				
				it "should destroy the associated grouped_exam_reports when deleted" do
					student = FactoryGirl.create(:student)
					student.grouped_exam_reports.create(FactoryGirl.attributes_for(:grouped_exam_report))

					expect{ student.destroy }.to change(GroupedExamReport, :count).by -1
				end
			
				
				it "should destroy the associated cce_reports when deleted" do
					student = FactoryGirl.create(:student)
					student.cce_reports.create(FactoryGirl.attributes_for(:cce_report))

					expect{ student.destroy }.to change(CceReport, :count).by -1
				end
			
				
				it "should destroy the associated assessment_scores when deleted" do
					student = FactoryGirl.create(:student)
					student.assessment_scores.create(FactoryGirl.attributes_for(:assessment_score))

					expect{ student.destroy }.to change(AssessmentScore, :count).by -1
				end
			
				
				it "should destroy the associated exam_scores when deleted" do
					student = FactoryGirl.create(:student)
					student.exam_scores.create(FactoryGirl.attributes_for(:exam_score))

					expect{ student.destroy }.to change(ExamScore, :count).by -1
				end
			
				
				it "should destroy the associated previous_exam_scores when deleted" do
					student = FactoryGirl.create(:student)
					student.previous_exam_scores.create(FactoryGirl.attributes_for(:previous_exam_score))

					expect{ student.destroy }.to change(PreviousExamScore, :count).by -1
				end
			
		end
		

  describe "Behavior" do
  	pending "add some examples to #{__FILE__} for behaviours or delete the 'Behaviour' test there."
  end
end
