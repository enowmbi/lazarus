require 'rails_helper'

RSpec.describe Employee, type: :model do
  before(:all) do 
    Rails.application.load_seed
  end

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


    it "should ensure the uniqueness of employee_number" do
      employee = FactoryBot.create(:employee)

      new_employee = FactoryBot.build(:employee, employee_number: employee.employee_number)

      expect(new_employee).not_to be_valid
      expect(new_employee.errors[:employee_number]).to be_present
    end



  end



  describe "Associations" do

    it "should belong to a employee_category" do
      employee_category = FactoryBot.create(:employee_category)
      employee = FactoryBot.build(:employee, employee_category: employee_category)
      expect(employee.employee_category).to eq employee_category
    end

    it "should belong to a employee_position" do
      employee_position = FactoryBot.create(:employee_position)
      employee = FactoryBot.build(:employee, employee_position: employee_position)
      expect(employee.employee_position).to eq employee_position
    end

    it "should belong to a employee_grade" do
      employee_grade = FactoryBot.create(:employee_grade)
      employee = FactoryBot.build(:employee, employee_grade: employee_grade)
      expect(employee.employee_grade).to eq employee_grade
    end

    it "should belong to a employee_department" do
      employee_department = FactoryBot.create(:employee_department)
      employee = FactoryBot.build(:employee, employee_department: employee_department)
      expect(employee.employee_department).to eq employee_department
    end

    it "should belong to a nationality" do
      nationality = FactoryBot.create(:nationality)
      employee = FactoryBot.build(:employee, nationality: nationality)
      expect(employee.nationality).to eq nationality
    end

    it "should belong to a user" do
      user = FactoryBot.create(:user)
      employee = FactoryBot.build(:employee, user: user)
      expect(employee.user).to eq user
    end

    it "should belong to a reporting_manager" do
      reporting_manager = FactoryBot.create(:reporting_manager)
      employee = FactoryBot.build(:employee, reporting_manager: reporting_manager)
      expect(employee.reporting_manager).to eq reporting_manager
    end



    it "should allow multiple employees_subjects" do
      employee = FactoryBot.create(:employee)

      3.times.each do |n|
        employees_subject = FactoryBot.create(:employees_subject)
        employee.employees_subjects << employees_subject
        employee_employees_subjects = employee.employees_subjects
        expect(employee_employees_subjects.count).to eq n.next
        expect(employee_employees_subjects).to include employees_subject
      end
    end


    it "should allow multiple subjects" do
      employee = FactoryBot.create(:employee)

      3.times.each do |n|
        subject = FactoryBot.create(:subject)
        employee.subjects << subject
        employee_subjects = employee.subjects
        expect(employee_subjects.count).to eq n.next
        expect(employee_subjects).to include subject
      end
    end


    it "should allow multiple timetable_entries" do
      employee = FactoryBot.create(:employee)

      3.times.each do |n|
        timetable_entry = FactoryBot.create(:timetable_entry)
        employee.timetable_entries << timetable_entry
        employee_timetable_entries = employee.timetable_entries
        expect(employee_timetable_entries.count).to eq n.next
        expect(employee_timetable_entries).to include timetable_entry
      end
    end


    it "should allow multiple employee_bank_details" do
      employee = FactoryBot.create(:employee)

      3.times.each do |n|
        employee_bank_detail = FactoryBot.create(:employee_bank_detail)
        employee.employee_bank_details << employee_bank_detail
        employee_employee_bank_details = employee.employee_bank_details
        expect(employee_employee_bank_details.count).to eq n.next
        expect(employee_employee_bank_details).to include employee_bank_detail
      end
    end


    it "should allow multiple employee_additional_details" do
      employee = FactoryBot.create(:employee)

      3.times.each do |n|
        employee_additional_detail = FactoryBot.create(:employee_additional_detail)
        employee.employee_additional_details << employee_additional_detail
        employee_employee_additional_details = employee.employee_additional_details
        expect(employee_employee_additional_details.count).to eq n.next
        expect(employee_employee_additional_details).to include employee_additional_detail
      end
    end


    it "should allow multiple apply_leaves" do
      employee = FactoryBot.create(:employee)

      3.times.each do |n|
        apply_leave = FactoryBot.create(:apply_leave)
        employee.apply_leaves << apply_leave
        employee_apply_leaves = employee.apply_leaves
        expect(employee_apply_leaves.count).to eq n.next
        expect(employee_apply_leaves).to include apply_leave
      end
    end


    it "should allow multiple monthly_payslips" do
      employee = FactoryBot.create(:employee)

      3.times.each do |n|
        monthly_payslip = FactoryBot.create(:monthly_payslip)
        employee.monthly_payslips << monthly_payslip
        employee_monthly_payslips = employee.monthly_payslips
        expect(employee_monthly_payslips.count).to eq n.next
        expect(employee_monthly_payslips).to include monthly_payslip
      end
    end


    it "should allow multiple employee_salary_structures" do
      employee = FactoryBot.create(:employee)

      3.times.each do |n|
        employee_salary_structure = FactoryBot.create(:employee_salary_structure)
        employee.employee_salary_structures << employee_salary_structure
        employee_employee_salary_structures = employee.employee_salary_structures
        expect(employee_employee_salary_structures.count).to eq n.next
        expect(employee_employee_salary_structures).to include employee_salary_structure
      end
    end


    it "should allow multiple finance_transactions" do
      employee = FactoryBot.create(:employee)

      3.times.each do |n|
        finance_transaction = FactoryBot.create(:finance_transaction)
        employee.finance_transactions << finance_transaction
        employee_finance_transactions = employee.finance_transactions
        expect(employee_finance_transactions.count).to eq n.next
        expect(employee_finance_transactions).to include finance_transaction
      end
    end


    it "should allow multiple employee_attendances" do
      employee = FactoryBot.create(:employee)

      3.times.each do |n|
        employee_attendance = FactoryBot.create(:employee_attendance)
        employee.employee_attendances << employee_attendance
        employee_employee_attendances = employee.employee_attendances
        expect(employee_employee_attendances.count).to eq n.next
        expect(employee_employee_attendances).to include employee_attendance
      end
    end


  end



  describe "Graceful Destroyal" do


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
