Given (/^I am a registered user$/) do
  user = FactoryBot.create(:user)
  @id = user.id
  visit registrazione_path
  register(user)
  click_button('Crea account')
end

And (/^I am not authenticated$/) do
  visit logout_path
end

And (/^I am on the login page$/) do
end

And (/^I insert valid credentials$/) do
end 

When (/^I click on login button$/) do
end

Then (/^I am signed in$/) do
end