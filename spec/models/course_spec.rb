# TODO: maybe add one for :has_and_belongs_to_many?

require 'rails_helper'

RSpec.describe Course, type: :model do

  it "should have a valid factory" do
    course = FactoryBot.build(:course)
    expect(course).to be_valid
  end

  describe "Validators" do

    it "should ensure the presence of course_name" do
      course = FactoryBot.build(:course, course_name: nil)
      expect(course).not_to be_valid
      expect(course.errors[:course_name]).to be_present
    end

    it "should ensure the presence of code" do
      course = FactoryBot.build(:course, code: nil)
      expect(course).not_to be_valid
      expect(course.errors[:code]).to be_present
    end

  end



  describe "Associations" do

    it{is_expected.to have_many(:batches)}

    it{is_expected.to have_many(:batch_groups)}

    it{is_expected.to have_many(:ranking_levels)}

    it{is_expected.to have_many(:class_designations)}

    it{is_expected.to have_many(:subject_amounts)}

  end

 xdescribe "Graceful Destroyal" do
 #TODO - if necessary - add dependent destroy to the belongs to part of the associations and then modify the association examples above
    it "should destroy the associated batches when deleted" do
      course = FactoryBot.create(:course)
      course.batches.create(FactoryBot.attributes_for(:batch))

      expect{ course.destroy }.to change(Batch, :count).by(-1)
    end


    it "should destroy the associated batch_groups when deleted" do
      course = FactoryBot.create(:course)
      course.batch_groups.create(FactoryBot.attributes_for(:batch_group))

      expect{ course.destroy }.to change(BatchGroup, :count).by(-1)
    end


    it "should destroy the associated ranking_levels when deleted" do
      course = FactoryBot.create(:course)
      course.ranking_levels.create(FactoryBot.attributes_for(:ranking_level))

      expect{ course.destroy }.to change(RankingLevel, :count).by(-1)
    end


    it "should destroy the associated class_designations when deleted" do
      course = FactoryBot.create(:course)
      course.class_designations.create(FactoryBot.attributes_for(:class_designation))

      expect{ course.destroy }.to change(ClassDesignation, :count).by(-1)
    end


    it "should destroy the associated subject_amounts when deleted" do
      course = FactoryBot.create(:course)
      course.subject_amounts.create(FactoryBot.attributes_for(:subject_amount))

      expect{ course.destroy }.to change(SubjectAmount, :count).by(-1)
    end

  end

end
