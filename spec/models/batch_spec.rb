require 'rails_helper'

RSpec.describe Batch, type: :model do

  it "should have a valid factory" do
    batch = FactoryBot.build(:batch)
    expect(batch).to be_valid
  end

  describe "Validators" do

    it "should ensure the presence of course" do
      batch = FactoryBot.build(:batch, course: nil)
      expect(batch).not_to be_valid
      expect(batch.errors[:course]).to be_present
    end
  end

  describe "Associations" do

    it "should belong to a course" do
      course = FactoryBot.create(:course)
      batch = FactoryBot.build(:batch, course: course)
      expect(batch.course).to eq course
    end



    it "should allow multiple students" do
      batch = FactoryBot.create(:batch)

      3.times.each do |n|
        student = FactoryBot.create(:student)
        batch.students << student
        batch_students = batch.students
        expect(batch_students.count).to eq n.next
        expect(batch_students).to include student
      end
    end


    it "should allow multiple grouped_exam_reports" do
      batch = FactoryBot.create(:batch)

      3.times.each do |n|
        grouped_exam_report = FactoryBot.create(:grouped_exam_report)
        batch.grouped_exam_reports << grouped_exam_report
        batch_grouped_exam_reports = batch.grouped_exam_reports
        expect(batch_grouped_exam_reports.count).to eq n.next
        expect(batch_grouped_exam_reports).to include grouped_exam_report
      end
    end


    it "should allow multiple grouped_batches" do
      batch = FactoryBot.create(:batch)

      3.times.each do |n|
        grouped_batch = FactoryBot.create(:grouped_batch)
        batch.grouped_batches << grouped_batch
        batch_grouped_batches = batch.grouped_batches
        expect(batch_grouped_batches.count).to eq n.next
        expect(batch_grouped_batches).to include grouped_batch
      end
    end


    it "should allow multiple archived_students" do
      batch = FactoryBot.create(:batch)

      3.times.each do |n|
        archived_student = FactoryBot.create(:archived_student)
        batch.archived_students << archived_student
        batch_archived_students = batch.archived_students
        expect(batch_archived_students.count).to eq n.next
        expect(batch_archived_students).to include archived_student
      end
    end


    it "should allow multiple grading_levels" do
      batch = FactoryBot.create(:batch)

      3.times.each do |n|
        grading_level = FactoryBot.create(:grading_level)
        batch.grading_levels << grading_level
        batch_grading_levels = batch.grading_levels
        expect(batch_grading_levels.count).to eq n.next
        expect(batch_grading_levels).to include grading_level
      end
    end


    it "should allow multiple subjects" do
      batch = FactoryBot.create(:batch)

      3.times.each do |n|
        subject = FactoryBot.create(:subject)
        batch.subjects << subject
        batch_subjects = batch.subjects
        expect(batch_subjects.count).to eq n.next
        expect(batch_subjects).to include subject
      end
    end


    it "should allow multiple employees_subjects" do
      batch = FactoryBot.create(:batch)

      3.times.each do |n|
        employees_subject = FactoryBot.create(:employees_subject)
        batch.employees_subjects << employees_subject
        batch_employees_subjects = batch.employees_subjects
        expect(batch_employees_subjects.count).to eq n.next
        expect(batch_employees_subjects).to include employees_subject
      end
    end


    it "should allow multiple exam_groups" do
      batch = FactoryBot.create(:batch)

      3.times.each do |n|
        exam_group = FactoryBot.create(:exam_group)
        batch.exam_groups << exam_group
        batch_exam_groups = batch.exam_groups
        expect(batch_exam_groups.count).to eq n.next
        expect(batch_exam_groups).to include exam_group
      end
    end


    it "should allow multiple fee_category" do
      batch = FactoryBot.create(:batch)

      3.times.each do |n|
        fee_category = FactoryBot.create(:finance_fee_category)
        batch.fee_category << fee_category
        batch_fee_category = batch.fee_category
        expect(batch_fee_category.count).to eq n.next
        expect(batch_fee_category).to include fee_category
      end
    end


    it "should allow multiple elective_groups" do
      batch = FactoryBot.create(:batch)

      3.times.each do |n|
        elective_group = FactoryBot.create(:elective_group)
        batch.elective_groups << elective_group
        batch_elective_groups = batch.elective_groups
        expect(batch_elective_groups.count).to eq n.next
        expect(batch_elective_groups).to include elective_group
      end
    end


    it "should allow multiple finance_fee_collections" do
      batch = FactoryBot.create(:batch)

      3.times.each do |n|
        finance_fee_collection = FactoryBot.create(:finance_fee_collection)
        batch.finance_fee_collections << finance_fee_collection
        batch_finance_fee_collections = batch.finance_fee_collections
        expect(batch_finance_fee_collections.count).to eq n.next
        expect(batch_finance_fee_collections).to include finance_fee_collection
      end
    end


    it "should allow multiple finance_transactions" do
      batch = FactoryBot.create(:batch)

      3.times.each do |n|
        finance_transaction = FactoryBot.create(:finance_transaction)
        batch.finance_transactions << finance_transaction
        batch_finance_transactions = batch.finance_transactions
        expect(batch_finance_transactions.count).to eq n.next
        expect(batch_finance_transactions).to include finance_transaction
      end
    end


    it "should allow multiple batch_events" do
      batch = FactoryBot.create(:batch)

      3.times.each do |n|
        batch_event = FactoryBot.create(:batch_event)
        batch.batch_events << batch_event
        batch_batch_events = batch.batch_events
        expect(batch_batch_events.count).to eq n.next
        expect(batch_batch_events).to include batch_event
      end
    end


    it "should allow multiple events" do
      batch = FactoryBot.create(:batch)

      3.times.each do |n|
        event = FactoryBot.create(:event)
        batch.events << event
        batch_events = batch.events
        expect(batch_events.count).to eq n.next
        expect(batch_events).to include event
      end
    end


    it "should allow multiple batch_fee_discounts" do
      batch = FactoryBot.create(:batch)

      3.times.each do |n|
        batch_fee_discount = FactoryBot.create(:batch_fee_discount)
        batch.batch_fee_discounts << batch_fee_discount
        batch_batch_fee_discounts = batch.batch_fee_discounts
        expect(batch_batch_fee_discounts.count).to eq n.next
        expect(batch_batch_fee_discounts).to include batch_fee_discount
      end
    end


    it "should allow multiple student_category_fee_discounts" do
      batch = FactoryBot.create(:batch)

      3.times.each do |n|
        student_category_fee_discount = FactoryBot.create(:student_category_fee_discount)
        batch.student_category_fee_discounts << student_category_fee_discount
        batch_student_category_fee_discounts = batch.student_category_fee_discounts
        expect(batch_student_category_fee_discounts.count).to eq n.next
        expect(batch_student_category_fee_discounts).to include student_category_fee_discount
      end
    end


    it "should allow multiple attendances" do
      batch = FactoryBot.create(:batch)

      3.times.each do |n|
        attendance = FactoryBot.create(:attendance)
        batch.attendances << attendance
        batch_attendances = batch.attendances
        expect(batch_attendances.count).to eq n.next
        expect(batch_attendances).to include attendance
      end
    end


    it "should allow multiple subject_leaves" do
      batch = FactoryBot.create(:batch)

      3.times.each do |n|
        subject_leave = FactoryBot.create(:subject_leave)
        batch.subject_leaves << subject_leave
        batch_subject_leaves = batch.subject_leaves
        expect(batch_subject_leaves.count).to eq n.next
        expect(batch_subject_leaves).to include subject_leave
      end
    end


    it "should allow multiple timetable_entries" do
      batch = FactoryBot.create(:batch)

      3.times.each do |n|
        timetable_entry = FactoryBot.create(:timetable_entry)
        batch.timetable_entries << timetable_entry
        batch_timetable_entries = batch.timetable_entries
        expect(batch_timetable_entries.count).to eq n.next
        expect(batch_timetable_entries).to include timetable_entry
      end
    end


    it "should allow multiple cce_reports" do
      batch = FactoryBot.create(:batch)

      3.times.each do |n|
        cce_report = FactoryBot.create(:cce_report)
        batch.cce_reports << cce_report
        batch_cce_reports = batch.cce_reports
        expect(batch_cce_reports.count).to eq n.next
        expect(batch_cce_reports).to include cce_report
      end
    end


    it "should allow multiple assessment_scores" do
      batch = FactoryBot.create(:batch)

      3.times.each do |n|
        assessment_score = FactoryBot.create(:assessment_score)
        batch.assessment_scores << assessment_score
        batch_assessment_scores = batch.assessment_scores
        expect(batch_assessment_scores.count).to eq n.next
        expect(batch_assessment_scores).to include assessment_score
      end
    end


  end



  describe "Graceful Destroyal" do




    it "should destroy the associated students when deleted" do
      batch = FactoryBot.create(:batch)
      batch.students.create(FactoryBot.attributes_for(:student))

      expect{ batch.destroy }.to change(Student, :count).by(-1)
    end


    it "should destroy the associated grouped_exam_reports when deleted" do
      batch = FactoryBot.create(:batch)
      batch.grouped_exam_reports.create(FactoryBot.attributes_for(:grouped_exam_report))

      expect{ batch.destroy }.to change(GroupedExamReport, :count).by(-1)
    end


    it "should destroy the associated grouped_batches when deleted" do
      batch = FactoryBot.create(:batch)
      batch.grouped_batches.create(FactoryBot.attributes_for(:grouped_batch))

      expect{ batch.destroy }.to change(GroupedBatch, :count).by(-1)
    end


    it "should destroy the associated archived_students when deleted" do
      batch = FactoryBot.create(:batch)
      batch.archived_students.create(FactoryBot.attributes_for(:archived_student))

      expect{ batch.destroy }.to change(ArchivedStudent, :count).by(-1)
    end


    it "should destroy the associated grading_levels when deleted" do
      batch = FactoryBot.create(:batch)
      batch.grading_levels.create(FactoryBot.attributes_for(:grading_level))

      expect{ batch.destroy }.to change(GradingLevel, :count).by(-1)
    end


    it "should destroy the associated subjects when deleted" do
      batch = FactoryBot.create(:batch)
      batch.subjects.create(FactoryBot.attributes_for(:subject))

      expect{ batch.destroy }.to change(Subject, :count).by(-1)
    end



    it "should destroy the associated exam_groups when deleted" do
      batch = FactoryBot.create(:batch)
      batch.exam_groups.create(FactoryBot.attributes_for(:exam_group))

      expect{ batch.destroy }.to change(ExamGroup, :count).by(-1)
    end


    it "should destroy the associated fee_category when deleted" do
      batch = FactoryBot.create(:batch)
      batch.fee_category.create(FactoryBot.attributes_for(:finance_fee_category))

      expect{ batch.destroy }.to change(FinanceFeeCategory, :count).by(-1)
    end


    it "should destroy the associated elective_groups when deleted" do
      batch = FactoryBot.create(:batch)
      batch.elective_groups.create(FactoryBot.attributes_for(:elective_group))

      expect{ batch.destroy }.to change(ElectiveGroup, :count).by(-1)
    end


    it "should destroy the associated finance_fee_collections when deleted" do
      batch = FactoryBot.create(:batch)
      batch.finance_fee_collections.create(FactoryBot.attributes_for(:finance_fee_collection))

      expect{ batch.destroy }.to change(FinanceFeeCollection, :count).by(-1)
    end



    it "should destroy the associated batch_events when deleted" do
      batch = FactoryBot.create(:batch)
      batch.batch_events.create(FactoryBot.attributes_for(:batch_event))

      expect{ batch.destroy }.to change(BatchEvent, :count).by(-1)
    end



    it "should destroy the associated batch_fee_discounts when deleted" do
      batch = FactoryBot.create(:batch)
      batch.batch_fee_discounts.create(FactoryBot.attributes_for(:batch_fee_discount))

      expect{ batch.destroy }.to change(BatchFeeDiscount, :count).by(-1)
    end


    it "should destroy the associated student_category_fee_discounts when deleted" do
      batch = FactoryBot.create(:batch)
      batch.student_category_fee_discounts.create(FactoryBot.attributes_for(:student_category_fee_discount))

      expect{ batch.destroy }.to change(StudentCategoryFeeDiscount, :count).by(-1)
    end


    it "should destroy the associated attendances when deleted" do
      batch = FactoryBot.create(:batch)
      batch.attendances.create(FactoryBot.attributes_for(:attendance))

      expect{ batch.destroy }.to change(Attendance, :count).by(-1)
    end


    it "should destroy the associated subject_leaves when deleted" do
      batch = FactoryBot.create(:batch)
      batch.subject_leaves.create(FactoryBot.attributes_for(:subject_leave))

      expect{ batch.destroy }.to change(SubjectLeave, :count).by(-1)
    end


    it "should destroy the associated timetable_entries when deleted" do
      batch = FactoryBot.create(:batch)
      batch.timetable_entries.create(FactoryBot.attributes_for(:timetable_entry))

      expect{ batch.destroy }.to change(TimetableEntry, :count).by(-1)
    end


    it "should destroy the associated cce_reports when deleted" do
      batch = FactoryBot.create(:batch)
      batch.cce_reports.create(FactoryBot.attributes_for(:cce_report))

      expect{ batch.destroy }.to change(CceReport, :count).by(-1)
    end


    it "should destroy the associated assessment_scores when deleted" do
      batch = FactoryBot.create(:batch)
      batch.assessment_scores.create(FactoryBot.attributes_for(:assessment_score))

      expect{ batch.destroy }.to change(AssessmentScore, :count).by(-1)
    end

  end


  describe "Behavior" do
    pending "add some examples to #{__FILE__} for behaviours or delete the 'Behaviour' test there."
  end
end
