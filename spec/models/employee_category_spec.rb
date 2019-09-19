require 'rails_helper'

RSpec.describe EmployeeCategory, type: :model do

  it "should have a valid factory" do
    employee_category = FactoryBot.build(:employee_category)
    expect(employee_category).to be_valid
  end

  describe "Validators" do

    it "should ensure the presence of name" do
      employee_category = FactoryBot.build(:employee_category, name: nil)
      expect(employee_category).not_to be_valid
      expect(employee_category.errors[:name]).to be_present
    end

    it "should ensure the presence of prefix" do
      employee_category = FactoryBot.build(:employee_category, prefix: nil)
      expect(employee_category).not_to be_valid
      expect(employee_category.errors[:prefix]).to be_present
    end

    it "should ensure the uniqueness of name" do
      employee_category = FactoryBot.create(:employee_category)
      new_employee_category = FactoryBot.build(:employee_category, name: employee_category.name)
      expect(new_employee_category).not_to be_valid
      expect(new_employee_category.errors[:name]).to be_present
    end

    it "should ensure the uniqueness of prefix" do
      employee_category = FactoryBot.create(:employee_category)
      new_employee_category = FactoryBot.build(:employee_category, prefix: employee_category.prefix)
      expect(new_employee_category).not_to be_valid
      expect(new_employee_category.errors[:prefix]).to be_present
    end
  end

  describe "Associations" do

    it{is_expected.to have_many(:employee_positions)}

    it{is_expected.to have_many(:employees)}

  end

   xdescribe "Graceful Destroyal" do
    #TODO - modify the above specs after adding dependent destroy
      it "should destroy the associated employee_positions when deleted" do
        employee_category = FactoryBot.create(:employee_category)
        employee_category.employee_positions.create(FactoryBot.attributes_for(:employee_position))

        expect{ employee_category.destroy }.to change(EmployeePosition, :count).by(-1)
      end


      it "should destroy the associated employees when deleted" do
        employee_category = FactoryBot.create(:employee_category)
        employee_category.employees.create(FactoryBot.attributes_for(:employee))

        expect{ employee_category.destroy }.to change(Employee, :count).by(-1)
      end

    end

  end
