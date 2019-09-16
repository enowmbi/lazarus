require 'rails_helper'


RSpec.describe School,type: :model do 

  it "should have a valid factory"  do 
    school = FactoryBot.build(:school)
    expect(school).to be_valid
  end

  describe "validators" do 
    it "should ensure the presence of #name" do 
      school = FactoryBot.build(:school,name:nil)
      expect(school).not_to be_valid
    end

    it "should ensure the uniqueness of #name" do 
      FactoryBot.create(:school,name: "School of Technology")
      expect{FactoryBot.create(:school,name: "School of Technology")}.to raise_error.with_message(/Name is already taken/)
    end

    it "should ensure presence of #code" do 
      school = FactoryBot.build(:school,code: nil) 
      expect(school).not_to be_valid
    end

    it "should ensure uniqueness of #code" do 
       FactoryBot.create(:school,code: 'SOT')
       expect{FactoryBot.create(:school,code:'SOT')}.to raise_error.with_message(/Code is already taken/)
    end
  end

  describe "Graceful Destroyal" do 
    it "should destroy all associated batches"
    it "should destroy all assciated courses"
  end
end
