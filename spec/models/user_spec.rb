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
    it "is invalid with a username longer than 128" do
        user_test = FactoryBot.build(:user, username:"a"*129)
        expect(user_test).to_not be_valid
    end
    it "has unique username (case-sensitive)" do
        user_test = FactoryBot.build(:user, username:@user.username.upcase)
        expect(user_test).to_not be_valid
    end
    it "is invalid without a email" do
        user_test = FactoryBot.build(:user, email:nil)
        expect(user_test).to_not be_valid
    end
    it "has unique email (case-sensitive)" do
        user_test = FactoryBot.build(:user, email:@user.email.upcase)
        expect(user_test).to_not be_valid
    end
    it "has a valid email (positive)" do
        user_test = FactoryBot.build(:user, email:"valid@email.com")
        expect(user_test).to be_valid
    end
    it "has a valid email (negative)" do
        user_test = FactoryBot.build(:user, email:"not_valid-email,com")
        expect(user_test).to_not be_valid
    end
    it "is invalid without a password" do
        user_test = FactoryBot.build(:user, password:nil)
        expect(user_test).to_not be_valid
    end
    
end