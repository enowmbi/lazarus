require 'rails_helper'

RSpec.describe Country, type: :model do

  it "should have a valid factory" do
    country = FactoryBot.build(:country)
    expect(country).to be_valid
  end

  describe "Validators" do

    it{is_expected.to validate_presence_of(:name)}

    it{is_expected.to validate_uniqueness_of(:name)}

  end

end
