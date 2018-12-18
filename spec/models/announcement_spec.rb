require 'rails_helper'

RSpec.describe Announcement, type: :model do

  before(:all) do
    @user = FactoryBot.create(:user)
    @ann = FactoryBot.create(:announcement, user_id: @user.id)
    @most_rec = FactoryBot.create(:most_recent, user_id: @user.id)
  end

  it "has a valid factory" do
    expect(@ann).to be_valid 
  end

  it "is invalid without user id" do
    ann_test = FactoryBot.build(:announcement, user_id:nil)
    expect(ann_test).to_not be_valid
  end

  it "is invalid without title" do
    ann_test = FactoryBot.build(:announcement, titolo:nil)
    expect(ann_test).to_not be_valid
  end

  it "is invalid with a title longer than 50" do
    ann_test = FactoryBot.build(:announcement, titolo:"a"*51)
    expect(ann_test).to_not be_valid
  end

  it "is invalid without description" do
    ann_test = FactoryBot.build(:announcement, descrizione:nil)
    expect(ann_test).to_not be_valid
  end

  it "is invalid without categoria" do
    ann_test = FactoryBot.build(:announcement, categoria:nil)
    expect(ann_test).to_not be_valid
  end

  it "is invalid without prezzo" do
    ann_test = FactoryBot.build(:announcement, prezzo:nil)
    expect(ann_test).to_not be_valid
  end

  it "is invalid without email" do
    ann_test = FactoryBot.build(:announcement, email:nil)
    expect(ann_test).to_not be_valid
  end

  it "has most recent first" do
    expect(@most_rec).to eq(Announcement.first)
  end

  it "is destroyed when the owner is destroyed" do
    count = Announcement.count
    @user.destroy
    expect(Announcement.count).to eq(count-2)
  end

end
