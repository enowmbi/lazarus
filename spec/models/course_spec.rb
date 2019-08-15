# TODO: maybe add one for :has_and_belongs_to_many?
# TODO: Implement insertions for existing files... why??

require 'rails_helper'

RSpec.describe Course, type: :model do
  it "should have a valid factory" do
    course = FactoryBot.build(:course)
    expect(course).to be_valid
  end

  xdescribe "Validators" do



    xit "should ensure the presence of course_name" do
      course = FactoryBot.build(:course, course_name: nil)
      expect(course).not_to be_valid
      expect(course.errors[:course_name]).to be_present
    end

    xit "should ensure the presence of code" do
      course = FactoryBot.build(:course, code: nil)
      expect(course).not_to be_valid
      expect(course.errors[:code]).to be_present
    end




  end



  xdescribe "Associations" do



    xit "should allow multiple batches" do
      course = FactoryBot.create(:course)

      3.times.each do |n|
        batch = FactoryBot.create(:batch)
        course.batches << batch
        course_batches = course.batches
        expect(course_batches.count).to eq n.next
        expect(course_batches).to include batch
      end
    end


    xit "should allow multiple batch_groups" do
      course = FactoryBot.create(:course)

      3.times.each do |n|
        batch_group = FactoryBot.create(:batch_group)
        course.batch_groups << batch_group
        course_batch_groups = course.batch_groups
        expect(course_batch_groups.count).to eq n.next
        expect(course_batch_groups).to include batch_group
      end
    end


    xit "should allow multiple ranking_levels" do
      course = FactoryBot.create(:course)

      3.times.each do |n|
        ranking_level = FactoryBot.create(:ranking_level)
        course.ranking_levels << ranking_level
        course_ranking_levels = course.ranking_levels
        expect(course_ranking_levels.count).to eq n.next
        expect(course_ranking_levels).to include ranking_level
      end
    end


    xit "should allow multiple class_designations" do
      course = FactoryBot.create(:course)

      3.times.each do |n|
        class_designation = FactoryBot.create(:class_designation)
        course.class_designations << class_designation
        course_class_designations = course.class_designations
        expect(course_class_designations.count).to eq n.next
        expect(course_class_designations).to include class_designation
      end
    end


    xit "should allow multiple subject_amounts" do
      course = FactoryBot.create(:course)

      3.times.each do |n|
        subject_amount = FactoryBot.create(:subject_amount)
        course.subject_amounts << subject_amount
        course_subject_amounts = course.subject_amounts
        expect(course_subject_amounts.count).to eq n.next
        expect(course_subject_amounts).to include subject_amount
      end
    end


  end



  xdescribe "Graceful Destroyal" do




    xit "should destroy the associated batches when deleted" do
      course = FactoryBot.create(:course)
      course.batches.create(FactoryBot.attributes_for(:batch))

      expect{ course.destroy }.to change(Batch, :count).by -1
    end


    xit "should destroy the associated batch_groups when deleted" do
      course = FactoryBot.create(:course)
      course.batch_groups.create(FactoryBot.attributes_for(:batch_group))

      expect{ course.destroy }.to change(BatchGroup, :count).by -1
    end


    xit "should destroy the associated ranking_levels when deleted" do
      course = FactoryBot.create(:course)
      course.ranking_levels.create(FactoryBot.attributes_for(:ranking_level))

      expect{ course.destroy }.to change(RankingLevel, :count).by -1
    end


    xit "should destroy the associated class_designations when deleted" do
      course = FactoryBot.create(:course)
      course.class_designations.create(FactoryBot.attributes_for(:class_designation))

      expect{ course.destroy }.to change(ClassDesignation, :count).by -1
    end


    xit "should destroy the associated subject_amounts when deleted" do
      course = FactoryBot.create(:course)
      course.subject_amounts.create(FactoryBot.attributes_for(:subject_amount))

      expect{ course.destroy }.to change(SubjectAmount, :count).by -1
    end

  end


  xdescribe "Behavior" do
    pending "add some examples to #{__FILE__} for behaviours or delete the 'Behaviour' test there."
  end
end
