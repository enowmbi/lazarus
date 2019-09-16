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
      {is_expected.to validate_uniqueness_of(:name)}
    end

    it "should ensure presence of #code"
  end
end
