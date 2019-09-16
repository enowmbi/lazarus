require 'rails_helper'

RSpec.describe Batch, type: :model do

  it "should have a valid factory" do
    course = FactoryBot.create(:course)
    batch = course.batches.build(FactoryBot.attributes_for(:batch))
    expect(batch).to be_valid
  end


  describe "Validators" do

    it {is_expected.to validate_presence_of(:name)}
    it {is_expected.to validate_presence_of(:start_date)}
    it {is_expected.to validate_presence_of(:end_date)}

    it "ensures that start_date is less than end_date" do 
      course = FactoryBot.create(:course)
      batch = course.batches.build(FactoryBot.attributes_for(:batch))

      batch.start_date = 1.year.from_now
      # expect{batch.start_date_must_be_less_than_end_date}.to raise_error.with_message(/start date should be before end date/)
      # it {is_expected.not_to validate(:start_date_must_be_less_than_end_date)}
    end

  end

  describe "Associations" do

    it {is_expected.to belong_to(:course)}

    it {is_expected.to have_many(:students)}

    it {is_expected.to have_many(:grouped_exam_reports)}

    it {is_expected.to have_many(:grouped_batches)}

    it {is_expected.to have_many(:archived_students)}

    it{is_expected.to have_many(:grading_levels)}

    it{is_expected.to have_many(:subjects)}

    it{is_expected.to have_many(:employees_subjects)}

    it{is_expected.to have_many(:exam_groups)}

    it{is_expected.to have_many(:fee_categories)}

   # it "should allow multiple fee_category" do
    # batch = FactoryBot.create(:batch)

    # 3.times.each do |n|
    # fee_category = FactoryBot.create(:finance_fee_category)
    # batch.fee_category << fee_category
    # batch_fee_category = batch.fee_category
    # expect(batch_fee_category.count).to eq n.next
    # expect(batch_fee_category).to include fee_category
    # end
    # end

    it {is_expected.to have_many(:elective_groups)}

    it{is_expected.to have_many(:finance_fee_collections)}

    it{is_expected.to have_many(:finance_transactions)}

    it{is_expected.to have_many(:batch_events)}

    it{is_expected.to have_many(:events)}

    it{is_expected.to have_many(:batch_fee_discounts)}

    it{is_expected.to have_many(:student_category_fee_discounts)}

    it{is_expected.to have_many(:attendances)}

    it{is_expected.to have_many(:subject_leaves)}

    it{is_expected.to have_many(:timetable_entries)}

    it{is_expected.to have_many(:cce_reports)}

    it{is_expected.to have_many(:assessment_scores)}

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
