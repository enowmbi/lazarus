require 'rails_helper'

RSpec.describe EmployeePosition, type: :model do
  
  it "should have a valid factory" do
    employee_category = FactoryBot.create(:employee_category)
    employee_position = FactoryBot.build(:employee_position,employee_category_id: employee_category.id)
    expect(employee_position).to be_valid
  end

  describe "Validators" do

    it "should ensure the presence of name" do
      employee_position = FactoryBot.build(:employee_position, name: nil)
      expect(employee_position).not_to be_valid
      expect(employee_position.errors[:name]).to be_present
    end

    it "should ensure the presence of employee_category_id" do
      employee_position = FactoryBot.build(:employee_position, employee_category_id: nil)
      expect(employee_position).not_to be_valid
      expect(employee_position.errors[:employee_category_id]).to be_present
    end

    it "should ensure the uniqueness of name" do
      employee_position = FactoryBot.create(:employee_position)
      new_employee_position = FactoryBot.build(:employee_position, name: employee_position.name, employee_category_id: employee_position.employee_category_id)
      expect(new_employee_position).not_to be_valid
      expect(new_employee_position.errors[:name]).to be_present
    end

  end


  describe "Associations" do

    it "should belong to a employee_category" do
      employee_category = FactoryBot.create(:employee_category)
      employee_position = FactoryBot.build(:employee_position, employee_category: employee_category)
      expect(employee_position.employee_category).to eq employee_category
    end

    it{is_expected.to have_many(:employees)}

  end

  xdescribe "Graceful Destroyal" do

    it "should destroy the associated employee when deleted" do
      employee_position = FactoryBot.create(:employee_position)
      employee_position.employee.create(FactoryBot.attributes_for(:employee))

      expect{ employee_position.destroy }.to change(Employee, :count).by(-1)
    end

  end

end

