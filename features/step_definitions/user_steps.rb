Given (/^I am a guest$/) do
  @user = nil
end

And (/^I am on the (.*) page$/) do |url|
  if(url == "edit")
    find(:xpath, "//a[@href='/users/"+@user.id.to_s+"/edit']").click
  else 
    visit url
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
  visit registrazione_path
  register(@user)
  click_button('Crea account')
end

And (/^I am not authenticated$/) do
  delete logout_path
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
  expect(page).to have_selector(:xpath,"//a[@href='/logout']" )
end

Then (/^I shouldn't be logged in$/) do
  expect(page).to have_current_path("/login")
end

Given (/^I am a registered user logged in$/) do
  @user = FactoryBot.create(:user)
  visit registrazione_path
  register(@user)
  click_button('Crea account')
  visit login_path
  login(@user)
  click_button("Accedi")
end


When (/^I click on (.*) link$/) do |value|
  find(:xpath, "//a[@href='/logout']").click
end


Then (/^I am not authenticated verifica$/) do
  expect(page).not_to have_selector(:xpath,"//a[@href='/logout']" )
end

When (/^I edit my profile/) do
  @user_test = FactoryBot.create(:user)
  edit(@user_test)
end

Then (/^Profile should be updated$/) do
  edit_check(@user,@user_test)
end




  
  