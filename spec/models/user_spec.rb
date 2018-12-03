# spec/models/user.rb
require 'spec_helper'

describe User do
    
    before(:all) do
        @user = FactoryBot.create(:user)
    end

    it "has a valid factory" do
        expect(@user).to be_valid 
    end
    it "is invalid without a username" do
        user_test = FactoryBot.build(:user, username:nil)
        expect(user_test).to_not be_valid
    end
    it "is invalid with a username shorter than 5" do
        user_test = FactoryBot.build(:user, username:"asdf")
        expect(user_test).to_not be_valid
    end
    it "is invalid with a username longer than 20" do
        user_test = FactoryBot.build(:user, username:"asdfghjklzxcvbnmqwert")
        expect(user_test).to_not be_valid
    end
    it "has unique username" do
        user_test = FactoryBot.build(:user, username:@user.username.upcase)
        expect(user_test).to_not be_valid
    end
    it "is invalid without a email" do
        user_test = FactoryBot.build(:user, email:nil)
        expect(user_test).to_not be_valid
    end
    it "is invalid without a password" do
        user_test = FactoryBot.build(:user, password:nil)
        expect(user_test).to_not be_valid
    end
    it "is invalid without a comune" do
        user_test = FactoryBot.build(:user, comune:nil)
        expect(user_test).to_not be_valid
    end
    it "is invalid without a data_nascita" do
        user_test = FactoryBot.build(:user, data_nascita:nil)
        expect(user_test).to_not be_valid
    end
    it "is invalid if not adult" do
        user_test = user_test = FactoryBot.build(:user, data_nascita: Date.new(2006,7,9))
        expect(user_test).to_not be_valid
    end
    it "returns a user's username as a string"
    it "returns a user's email as a string"
    it "returns a user's comune as a string"
    it "returns a user's data_nascita as a string"
end