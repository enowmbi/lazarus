require 'rails_helper'

RSpec.describe ArchivedStudent, type: :model do
  it "should have a valid factory" do
    archived_student = FactoryBot.build(:archived_student)
    expect(archived_student).to be_valid
  end

  describe "Validators" do
    it "should ensure the presence of country" do
      archived_student = FactoryBot.build(:archived_student, country: nil)
      expect(archived_student).not_to be_valid
      expect(archived_student.errors[:country]).to be_present
    end
  end

  describe "Associations" do

    it "should belong to a country" do
      country = FactoryBot.create(:country)
      archived_student = FactoryBot.build(:archived_student, country: country)
      expect(archived_student.country).to eq country
    end

    it "should belong to a batch" do
      batch = FactoryBot.create(:batch)
      archived_student = FactoryBot.build(:archived_student, batch: batch)
      expect(archived_student.batch).to eq batch
    end

    it "should belong to a student_category" do
      student_category = FactoryBot.create(:student_category)
      archived_student = FactoryBot.build(:archived_student, student_category: student_category)
      expect(archived_student.student_category).to eq student_category
    end

    it "should belong to a nationality" do
      nationality = FactoryBot.create(:nationality)
      archived_student = FactoryBot.build(:archived_student, nationality: nationality)
      expect(archived_student.nationality).to eq nationality
    end



    it "should allow multiple archived_guardians" do
      archived_student = FactoryBot.create(:archived_student)

      3.times.each do |n|
        archived_guardian = FactoryBot.create(:archived_guardian)
        archived_student.archived_guardians << archived_guardian
        archived_student_archived_guardians = archived_student.archived_guardians
        expect(archived_student_archived_guardians.count).to eq n.next
        expect(archived_student_archived_guardians).to include archived_guardian
      end
    end


    it "should allow multiple students_subjects" do
      archived_student = FactoryBot.create(:archived_student)

      3.times.each do |n|
        students_subject = FactoryBot.create(:students_subject)
        archived_student.students_subjects << students_subject
        archived_student_students_subjects = archived_student.students_subjects
        expect(archived_student_students_subjects.count).to eq n.next
        expect(archived_student_students_subjects).to include students_subject
      end
    end


    it "should allow multiple subjects" do
      archived_student = FactoryBot.create(:archived_student)

      3.times.each do |n|
        subject = FactoryBot.create(:subject)
        archived_student.subjects << subject
        archived_student_subjects = archived_student.subjects
        expect(archived_student_subjects.count).to eq n.next
        expect(archived_student_subjects).to include subject
      end
    end


    it "should allow multiple cce_reports" do
      archived_student = FactoryBot.create(:archived_student)

      3.times.each do |n|
        cce_report = FactoryBot.create(:cce_report)
        archived_student.cce_reports << cce_report
        archived_student_cce_reports = archived_student.cce_reports
        expect(archived_student_cce_reports.count).to eq n.next
        expect(archived_student_cce_reports).to include cce_report
      end
    end


    it "should allow multiple assessment_scores" do
      archived_student = FactoryBot.create(:archived_student)

      3.times.each do |n|
        assessment_score = FactoryBot.create(:assessment_score)
        archived_student.assessment_scores << assessment_score
        archived_student_assessment_scores = archived_student.assessment_scores
        expect(archived_student_assessment_scores.count).to eq n.next
        expect(archived_student_assessment_scores).to include assessment_score
      end
    end


    it "should allow multiple exam_scores" do
      archived_student = FactoryBot.create(:archived_student)

      3.times.each do |n|
        exam_score = FactoryBot.create(:exam_score)
        archived_student.exam_scores << exam_score
        archived_student_exam_scores = archived_student.exam_scores
        expect(archived_student_exam_scores.count).to eq n.next
        expect(archived_student_exam_scores).to include exam_score
      end
    end
  end

  describe "Graceful Destroyal" do 
    it "should destroy the associated photo_attachment when deleted" do
      archived_student = FactoryBot.create(:archived_student)
      photo_attachment = FactoryBot.create(:photo_attachment)
      archived_student.photo_attachments << photo_attachment

      expect{ archived_student.destroy }.to change(ActiveStorage::Attachment, :count).by(-1)
    end





    it "should destroy the associated archived_guardians when deleted" do
      archived_student = FactoryBot.create(:archived_student)
      archived_student.archived_guardians.create(FactoryBot.attributes_for(:archived_guardian))

      expect{ archived_student.destroy }.to change(ArchivedGuardian, :count).by(-1)
    end


    it "should destroy the associated students_subjects when deleted" do
      archived_student = FactoryBot.create(:archived_student)
      archived_student.students_subjects.create(FactoryBot.attributes_for(:students_subject))

      expect{ archived_student.destroy }.to change(StudentsSubject, :count).by(-1)
    end



    it "should destroy the associated cce_reports when deleted" do
      archived_student = FactoryBot.create(:archived_student)
      archived_student.cce_reports.create(FactoryBot.attributes_for(:cce_report))

      expect{ archived_student.destroy }.to change(CceReport, :count).by(-1)
    end


    it "should destroy the associated assessment_scores when deleted" do
      archived_student = FactoryBot.create(:archived_student)
      archived_student.assessment_scores.create(FactoryBot.attributes_for(:assessment_score))

      expect{ archived_student.destroy }.to change(AssessmentScore, :count).by(-1)
    end


    it "should destroy the associated exam_scores when deleted" do
      archived_student = FactoryBot.create(:archived_student)
      archived_student.exam_scores.create(FactoryBot.attributes_for(:exam_score))

      expect{ archived_student.destroy }.to change(ExamScore, :count).by(-1)
    end

  end


end
