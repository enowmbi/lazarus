require 'rails_helper'

RSpec.describe Employee, type: :model do

  it "should have a valid factory" do
    employee = FactoryBot.build(:employee)
    expect(employee).to be_valid
  end

  describe "Validators" do

    it "should ensure the presence of employee_category" do
      employee = FactoryBot.build(:employee, employee_category: nil)
      expect(employee).not_to be_valid
      expect(employee.errors[:employee_category]).to be_present
    end

    it{is_expected.to validate_uniqueness_of(:employee_number)}

  end

  describe "Associations" do

    it {is_expected.to belong_to(:employee_category)}

    it{is_expected.to belong_to(:employee_position)}

    it{is_expected.to belong_to(:employee_grade)}

    it{is_expected.to belong_to(:employee_department)}

    it{is_expected.to belong_to(:nationality).class_name(:Country)}

    it{is_expected.to belong_to(:reporting_manager)}

    it{is_expected.to have_many(:employees_subjects)}

    it{is_expected.to have_many(:subjects)}

    it{is_expected.to have_many(:timetable_entries)}

    it{is_expected.to have_many(:employee_bank_details)}

    it{is_expected.to have_many(:employee_additional_details)}

    it{is_expected.to have_many(:monthly_payslips)}

    it{is_expected.to have_many(:employee_salary_structures)}

    it{is_expected.to have_many(:finance_transactions)}

    it{is_expected.to have_many(:employee_attendances)}

  end


  xdescribe "Graceful Destroyal" do

    it "should destroy the associated photo_attachment when deleted" do
      employee = FactoryBot.create(:employee)
      photo_attachment = FactoryBot.create(:photo_attachment)
      employee.photo_attachments << photo_attachment

      expect{ employee.destroy }.to change(ActiveStorage::Attachment, :count).by(-1)
    end


    it "should destroy the associated employees_subjects when deleted" do
      employee = FactoryBot.create(:employee)
      employee.employees_subjects.create(FactoryBot.attributes_for(:employees_subject))

      expect{ employee.destroy }.to change(EmployeesSubject, :count).by(-1)
    end


    it "should destroy the associated timetable_entries when deleted" do
      employee = FactoryBot.create(:employee)
      employee.timetable_entries.create(FactoryBot.attributes_for(:timetable_entry))

      expect{ employee.destroy }.to change(TimetableEntry, :count).by(-1)
    end


    it "should destroy the associated employee_bank_details when deleted" do
      employee = FactoryBot.create(:employee)
      employee.employee_bank_details.create(FactoryBot.attributes_for(:employee_bank_detail))

      expect{ employee.destroy }.to change(EmployeeBankDetail, :count).by(-1)
    end


    it "should destroy the associated employee_additional_details when deleted" do
      employee = FactoryBot.create(:employee)
      employee.employee_additional_details.create(FactoryBot.attributes_for(:employee_additional_detail))

      expect{ employee.destroy }.to change(EmployeeAdditionalDetail, :count).by(-1)
    end


    it "should destroy the associated apply_leaves when deleted" do
      employee = FactoryBot.create(:employee)
      employee.apply_leaves.create(FactoryBot.attributes_for(:apply_leave))

      expect{ employee.destroy }.to change(ApplyLeave, :count).by(-1)
    end


    it "should destroy the associated monthly_payslips when deleted" do
      employee = FactoryBot.create(:employee)
      employee.monthly_payslips.create(FactoryBot.attributes_for(:monthly_payslip))

      expect{ employee.destroy }.to change(MonthlyPayslip, :count).by(-1)
    end


    it "should destroy the associated employee_salary_structures when deleted" do
      employee = FactoryBot.create(:employee)
      employee.employee_salary_structures.create(FactoryBot.attributes_for(:employee_salary_structure))

      expect{ employee.destroy }.to change(EmployeeSalaryStructure, :count).by(-1)
    end


    it "should destroy the associated finance_transactions when deleted" do
      employee = FactoryBot.create(:employee)
      employee.finance_transactions.create(FactoryBot.attributes_for(:finance_transaction))

      expect{ employee.destroy }.to change(FinanceTransaction, :count).by(-1)
    end


    it "should destroy the associated employee_attendances when deleted" do
      employee = FactoryBot.create(:employee)
      employee.employee_attendances.create(FactoryBot.attributes_for(:employee_attendance))

      expect{ employee.destroy }.to change(EmployeeAttendance, :count).by(-1)
    end

  end


  describe "Behavior" do
    pending "add some examples to #{__FILE__} for behaviours or delete the 'Behaviour' test there."
  end
end
