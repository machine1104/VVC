Given (/^I am a guest$/) do
  @user = nil
end

And (/^I am on the (.*) page$/) do |url|
  if(url == "edit")
    find(:xpath, "//a[@href='/users/edit']").click
  else 
    visit 'users/'+url
  end
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
  visit new_user_registration_path
  register(@user)
  click_button('Registrati')
end

And (/^I am not authenticated$/) do
  delete destroy_user_session_path
end

And (/^I insert valid credentials for login$/) do
  login(@user)
end

And (/^I insert invalid credentials for login$/) do
  @user2 = FactoryBot.build(:user, email: "email.invalid")
  login(@user2)
end

When (/^I click on (.*) button$/) do |value|
  click_button(value)
end

Then (/^I am authenticated$/) do
  expect(page).to have_current_path("/")
end

Then (/^I fail login$/) do
  expect(page).to have_current_path("/users/login")
end

Given (/^I am a registered user logged in$/) do
  @user = FactoryBot.create(:user)
  visit new_user_registration_path
  register(@user)
  click_button('Registrati')
  visit new_user_session_path
  login(@user)
  click_button("Log in")
end


When (/^I click on (.*) link$/) do |value|
  find(:xpath, "//a[@href='/users/"+value+"']").click
end


Then (/^I am not authenticated verifica$/) do
  expect(page).to have_current_path("/")
end

When (/^I edit my profile/) do
  @user_test = FactoryBot.create(:user)
  edit(@user_test)
end

Then (/^Profile should be updated$/) do
  edit_check(@user,@user_test)
end




  
  