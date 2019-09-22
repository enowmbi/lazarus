require 'rails_helper'

RSpec.describe GroupedExamReport, type: :model do
  it "should have a valid factory" do
    grouped_exam_report = FactoryBot.build(:grouped_exam_report)
    expect(grouped_exam_report).to be_valid
  end

  describe "Validators" do
    it "should ensure the presence of batch" do
      grouped_exam_report = FactoryBot.build(:grouped_exam_report, batch: nil)
      expect(grouped_exam_report).not_to be_valid
      expect(grouped_exam_report.errors[:batch]).to be_present
    end
  end

  describe "Associations" do

    it "should belong to a batch" do
      batch = FactoryBot.create(:batch)
      grouped_exam_report = FactoryBot.build(:grouped_exam_report, batch: batch)
      expect(grouped_exam_report.batch).to eq batch
    end

    it "should belong to a student" do
      student = FactoryBot.create(:student)
      grouped_exam_report = FactoryBot.build(:grouped_exam_report, student: student)
      expect(grouped_exam_report.student).to eq student
    end

    it "should belong to a subject" do
      subject = FactoryBot.create(:subject)
      grouped_exam_report = FactoryBot.build(:grouped_exam_report, subject: subject)
      expect(grouped_exam_report.subject).to eq subject
    end
  end

end
