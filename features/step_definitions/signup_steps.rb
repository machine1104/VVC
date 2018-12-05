Given (/^I am a guest$/) do
  @user = nil
end

And (/^I am on the registration page$/) do
  visit registrazione_path
end

And (/^I insert valid informations$/) do
  @count = User.count
  @user = FactoryBot.create(:user)
  register(@user)
end

And (/^I insert invalid informations$/) do
  @count = User.count
  register(FactoryBot.build(:user, username:nil))
end

When (/^I click on register button$/) do
  click_button("Crea account")
end

Then (/^I should be registered$/) do
  expect(User.count).to equal(@count+1)
end

Then (/^I shouldn't be registered$/) do
  expect(User.count).to equal(@count)
end


