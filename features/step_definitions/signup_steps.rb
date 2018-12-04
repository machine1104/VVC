Given (/^I am a guest$/) do
  @user = nil
end

And (/^I am on the homepage$/) do
  visit root_path
end

When (/^I register a valid account$/) do
  register(FactoryBot.create(:user))
end

Given (/^I should be on profile page$/) do
  expect
end


module LoginSteps
  def register(user)
    visit registrazione_path
    fill_in('user_username', with: user.username)
    fill_in('user_email', with: user.email)
    fill_in('user_password', with: user.password)
    fill_in('user_password_confirmation', with: user.password)
    fill_in('user_comune', with: user.comune)
    fill_in('flatpickr-input', with: user.data_nascita)
    click_button("Crea account")
  end
end
  
    
World(LoginSteps)

