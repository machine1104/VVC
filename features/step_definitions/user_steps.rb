Given (/^I am a guest$/) do
  @user = nil
end

And (/^I am on the (.*) page$/) do |url|
  visit url
end

And (/^I insert valid informations$/) do
  @count = User.count
  @user = FactoryBot.create(:user)
  register(@user)
end

And (/^I insert invalid informations$/) do
  @count = User.count
  @user = FactoryBot.build(:user, username:nil)
  register(@user)
end

Then (/^I should be registered$/) do
  expect(User.count).to equal(@count+1)
end

Then (/^I shouldn't be registered$/) do
  expect(User.count).to equal(@count)
end

Given (/^I am a registered user$/) do
  @user = FactoryBot.create(:user)
  visit registrazione_path
  register(@user)
  click_button('Crea account')
end

And (/^I am not authenticated$/) do
  delete logout_path
end

And (/^I insert valid credentials for login$/) do
  pollo = login(@user)
end

And (/^I insert invalid credentials for login$/) do
  @user2 = FactoryBot.build(:user, email: "email.invalid")
  login(@user2)
end

When (/^I click on (.*) button$/) do |value|
  click_button(value)
end

Then (/^I am authenticated$/) do
  expect(page).to have_current_path("/users/" + @user.id.to_s)
end

Then (/^I shouldn't be logged in$/) do
  expect(page).to have_current_path("/login")
end

  
  