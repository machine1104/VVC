Given (/^I am a guest$/) do
  @user = nil
end

And (/^I am on the registration page$/) do
  visit registrazione_path
end

When (/^I click on register button$/) do
  @count = User.count
  register(FactoryBot.create(:user))
end

Then (/^I should be registered$/) do
  expect(User.count).to equal(@count+1)
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

