require 'rails_helper'

RSpec.describe Subject, type: :model do
  it "should have a valid factory" do
    subject = FactoryBot.build(:subject)
    expect(subject).to be_valid
  end

  describe "Validators" do

    it{is_expected.to validate_presence_of(:batch_id)}

    xit{is_expected.to validate_uniqueness_of(:code)}

    xit "should ensure the uniqueness of code" do
      subject = FactoryBot.create(:subject)

      new_subject = FactoryBot.build(:subject, code: subject.code)

      expect(new_subject).not_to be_valid
      expect(new_subject.errors[:code]).to be_present
    end

  end


  describe "Associations" do

    it{is_expected.to belong_to(:batch)}

    it{is_expected.to have_many(:timetable_entries)}

    it{is_expected.to have_many(:employees_subjects)}

    it{is_expected.to have_many(:employees)}

    it{is_expected.to have_many(:students_subjects)}

    it{is_expected.to have_many(:students)}

    it{is_expected.to have_many(:grouped_exam_reports)}

  end

  xdescribe "Graceful Destroyal" do

    it "should destroy the associated timetable_entries when deleted" do
      subject = FactoryBot.create(:subject)
      subject.timetable_entries.create(FactoryBot.attributes_for(:timetable_entry))

      expect{ subject.destroy }.to change(TimetableEntry, :count).by(-1)
    end


    it "should destroy the associated employees_subjects when deleted" do
      subject = FactoryBot.create(:subject)
      subject.employees_subjects.create(FactoryBot.attributes_for(:employees_subject))

      expect{ subject.destroy }.to change(EmployeesSubject, :count).by(-1)
    end



    it "should destroy the associated students_subjects when deleted" do
      subject = FactoryBot.create(:subject)
      subject.students_subjects.create(FactoryBot.attributes_for(:students_subject))

      expect{ subject.destroy }.to change(StudentsSubject, :count).by(-1)
    end



    it "should destroy the associated grouped_exam_reports when deleted" do
      subject = FactoryBot.create(:subject)
      subject.grouped_exam_reports.create(FactoryBot.attributes_for(:grouped_exam_report))

      expect{ subject.destroy }.to change(GroupedExamReport, :count).by(-1)
    end

  end

end
