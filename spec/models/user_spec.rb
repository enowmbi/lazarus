require 'rails_helper'

RSpec.describe User, type: :model do
  it "should have a valid factory" do
    user = FactoryBot.build(:user)
    expect(user).to be_valid
  end

  describe "Validators" do

    it{is_expected.to validate_presence_of(:password)}

    it{is_expected.to validate_uniqueness_of(:username).scoped_to(:is_deleted)}

  end

  describe "Associations" do

    it{is_expected.to have_many(:user_events)}

    it{is_expected.to have_many(:events)}

    it{is_expected.to have_one(:employee_record).class_name(:Employee)}

  end

  xdescribe "Graceful Destroyal" do

    it "should destroy the associated student_record when deleted" do
      user = FactoryBot.create(:user)
      student_record = FactoryBot.create(:student_record)
      user.student_records << student_record

      expect{ user.destroy }.to change(Student, :count).by(-1)
    end

    it "should destroy the associated employee_record when deleted" do
      user = FactoryBot.create(:user)
      employee_record = FactoryBot.create(:employee_record)
      user.employee_records << employee_record

      expect{ user.destroy }.to change(Employee, :count).by(-1)
    end

    it "should destroy the associated user_events when deleted" do
      user = FactoryBot.create(:user)
      user.user_events.create(FactoryBot.attributes_for(:user_event))

      expect{ user.destroy }.to change(UserEvent, :count).by(-1)
    end

  end
end

