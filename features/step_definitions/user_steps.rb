Given (/^I am a guest$/) do
  @user = nil
end

And (/^I am on the (.*) page$/) do |url|
  if(url == "edit")
    visit edit_user_registration_path
  elsif(url == "new announcement")
    visit new_user_announcement_path(@user.id)
  elsif(url == "modifica annuncio")
    visit edit_user_announcement_path(@user.id,Announcement.where(user_id: @user.id).first.id)  
  else 
    visit 'users/'+url
  end
end

And (/^I have an announcement$/) do
  visit new_user_announcement_path(@user.id)
  @ad = FactoryBot.build(:announcement)
  create_announcement(@ad)
  click_button('Crea annuncio')
end

And (/^I insert valid informations$/) do
  @count = User.count
  @user = FactoryBot.build(:user)
  register(@user)
end

And (/^I insert valid announcement informations$/) do
  @count_annoucement = Announcement.count
  @ad = FactoryBot.build(:announcement)
  create_announcement(@ad)
end

And (/^I insert invalid informations$/) do
  @count = User.count
  @user = FactoryBot.build(:user, username:nil)
  register(@user)
end

Then (/^I should be registered$/) do
  expect(User.count).to equal(@count+1)
end

Then (/^Announcement should be created$/) do
  expect(Announcement.count).to equal(@count_annoucement+1)
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

And (/^I edit my announcement/) do
  @ad_test = FactoryBot.build(:edited_ad)
  edit_ad(@ad_test)
end

Then (/^Profile should be updated$/) do
  edit_check(@user,@user_test)
end

Then (/^Announcement should be updated$/) do
  edit_ad_check(@user,@ad_test)
end

Then (/^Profile should be deleted$/) do
  aux = User.find_by(id: @user.id)
  expect(aux).to be_nil
end




  
  