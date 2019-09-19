require 'rails_helper'

RSpec.describe EmployeeDepartment, type: :model do
  it "should have a valid factory" do
    employee_department = FactoryBot.build(:employee_department)
    expect(employee_department).to be_valid
  end

  describe "Validators" do

    it{is_expected.to validate_presence_of(:name)}

    it{is_expected.to validate_uniqueness_of(:name)}

    it{is_expected.to validate_uniqueness_of(:code)}

  end


  describe "Associations" do

    it{is_expected.to have_many(:employees)}

    it{is_expected.to have_many(:employee_department_events)}

    it{is_expected.to have_many(:employee_department_events)}

  end

  xdescribe "Graceful Destroyal" do
  #TODO: modify the expectations above if dependent: :destroy
    it "should destroy the associated employees when deleted" do
      employee_department = FactoryBot.create(:employee_department)
      employee_department.employees.create(FactoryBot.attributes_for(:employee))

      expect{ employee_department.destroy }.to change(Employee, :count).by(-1)
    end

    it "should destroy the associated employee_department_events when deleted" do
      employee_department = FactoryBot.create(:employee_department)
      employee_department.employee_department_events.create(FactoryBot.attributes_for(:employee_department_event))

      expect{ employee_department.destroy }.to change(EmployeeDepartmentEvent, :count).by(-1)
    end

  end

end
