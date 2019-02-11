Given(/^I am a guest$/) do
  @user = nil
end

And(/^I am on the (.*) page$/) do |url|
  if url == 'edit'
    visit edit_user_registration_path
  elsif url == 'new announcement'
    visit new_user_announcement_path(@user.id)
  elsif url == 'modifica annuncio'
    id_ann = current_path.split('/').last
    visit edit_user_announcement_path(@user.id, id_ann)
  elsif url == 'miei annunci'
    visit user_miei_annunci_path(@user.id)
  elsif url == 'announcements'
    visit announcements_path
  elsif url == 'home'
    visit root_path
  else
    visit 'users/' + url
  end
end

And(/^I have an announcement$/) do
  visit new_user_announcement_path(@user.id)
  @ad = FactoryBot.build(:announcement)
  create_announcement(@ad)
  click_button('Crea annuncio')
  @ann_count = Announcement.count
end

And(/^I insert valid informations$/) do
  @count = User.count
  @user = FactoryBot.build(:user)
  register(@user)
end

And(/^I insert valid announcement informations$/) do
  @count_annoucement = Announcement.count
  @ad = FactoryBot.build(:announcement)
  create_announcement(@ad)
end

And(/^I insert invalid announcement informations$/) do
  @count_annoucement = Announcement.count
  @ad = FactoryBot.build(:announcement, titolo: nil)
  create_announcement(@ad)
end

And(/^I insert invalid informations$/) do
  @count = User.count
  @user = FactoryBot.build(:user, username: nil)
  register(@user)
end

Then(/^I should be registered$/) do
  expect(User.count).to equal(@count + 1)
end

Then(/^Announcement should be created$/) do
  expect(Announcement.count).to equal(@count_annoucement + 1)
end

Then(/^Announcement should not be created$/) do
  expect(Announcement.count).to equal(@count_annoucement)
end

Then(/^I shouldn't be registered$/) do
  expect(User.count).to equal(@count)
end

Given(/^I am a registered user$/) do
  @user = FactoryBot.create(:user)
  visit new_user_registration_path
  register(@user)
  click_button('Registrati')
end

And(/^I am not authenticated$/) do
  delete destroy_user_session_path
end

And(/^I insert valid credentials for login$/) do
  login(@user)
end

And(/^I insert invalid credentials for login$/) do
  @user2 = FactoryBot.build(:user, email: 'email.invalid')
  login(@user2)
end

When(/^I click on (.*) button$/) do |value|
  click_button(value)
end

Then(/^I am authenticated$/) do
  expect(page).to have_current_path('/')
end

Then(/^I fail login$/) do
  expect(page).to have_current_path('/users/login')
end

Given(/^I am a registered user logged in$/) do
  @user = FactoryBot.create(:user)
  visit new_user_registration_path
  register(@user)
  click_button('Registrati')
  visit new_user_session_path
  login(@user)
  click_button('Login')
end

When(/^I click on (.*) link$/) do |value|
  if value == 'logo'
    page.find_link('Vieni Vedi Compra!').click
  elsif value == 'Elimina'
    click_link(value)
  elsif value == 'contatti'
    page.find_link('Contatti').click
  elsif value == 'motori'
    page.find(:xpath, "//a/img[@alt='Motori']/..").click
  elsif value == 'elettronica'
    page.find(:xpath, "//a/img[@alt='Elettronica']/..").click
  elsif value == 'abbigliamento'
    page.find(:xpath, "//a/img[@alt='Abbigliamento']/..").click
  elsif value == 'arredamento'
    page.find(:xpath, "//a/img[@alt='Arredamento']/..").click
  elsif value == 'sport'
    page.find(:xpath, "//a/img[@alt='Sport']/..").click
  elsif value == 'hobby'
    page.find(:xpath, "//a/img[@alt='Hobby']/..").click
  elsif value == 'attrezzature'
    page.find(:xpath, "//a/img[@alt='Attrezzature']/..").click
  elsif value == 'elettrodomestici'
    page.find(:xpath, "//a/img[@alt='Elettrodomestici']/..").click
  elsif value == 'giocattoli'
    page.find(:xpath, "//a/img[@alt='Giocattoli']/..").click
  elsif value == 'videogiochi'
    page.find(:xpath, "//a/img[@alt='Videogames']/..").click
  else
    find(:xpath, "//a[@href='/users/" + value + "']").click
  end
end

Then(/^I am not authenticated verifica$/) do
  expect(page).to have_current_path('/')
end

When(/^I edit my profile/) do
  @user_test = FactoryBot.create(:user)
  edit(@user_test)
end

And(/^I edit my announcement with valid informations/) do
  @old_info = @ad.posizione
  @new_info = 'Roma'
  fill_in('autocomplete_address', with: @new_info)
end

And(/^I edit my announcement with invalid informations/) do
  @old_info = @ad.posizione
  @new_info = nil
  fill_in('autocomplete_address', with: @new_info)
end

Then(/^Profile should be updated$/) do
  edit_check(@user, @user_test)
end

Then(/^Announcement should be updated$/) do
  expect(@ad.posizione).to eq(@new_info)
end

Then(/^Announcement should not be updated$/) do
  expect(@ad.posizione).to equal(@old_info)
end

Then(/^Profile should be deleted$/) do
  aux = User.find_by(id: @user.id)
  expect(aux).to be_nil
end

Then(/^ad should be deleted$/) do
  aux = Announcement.find_by(id: @announcement.id)
  expect(aux).to be_nil
end

Then(/^I should be on (.*) page$/) do |v|
  if v == 'login'
    expect(page).to have_current_path('/users/login')
  elsif v == 'home'
    expect(page).to have_current_path('/')
  elsif v == 'sign_up'
    expect(page).to have_current_path('/users/sign_up')
  elsif v == 'motori'
    expect(page).to have_current_path('/announcements?categoria=Motori+e+accessori')
  elsif v == 'elettronica'
    expect(page).to have_current_path('/announcements?categoria=Elettronica')
  elsif v == 'abbigliamento'
    expect(page).to have_current_path('/announcements?categoria=Abbigliamento')
  elsif v == 'arredamento'
    expect(page).to have_current_path('/announcements?categoria=Arredamento')
  elsif v == 'sport'
    expect(page).to have_current_path('/announcements?categoria=Sport')
  elsif v == 'hobby'
    expect(page).to have_current_path('/announcements?categoria=Hobby')
  elsif v == 'attrezzature'
    expect(page).to have_current_path('/announcements?categoria=Attrezzature')
  elsif v == 'elettrodomestici'
    expect(page).to have_current_path('/announcements?categoria=Elettrodomestici')
  elsif v == 'giocattoli'
    expect(page).to have_current_path('/announcements?categoria=Giocattoli')
  elsif v == 'videogiochi'
    expect(page).to have_current_path('/announcements?categoria=Videogiochi+e+console')
  elsif v == 'nearby'
    expect(page).to have_current_path('/announcements/nearby?utf8=%E2%9C%93&place=Roma&distance_range=5&commit=Cerca+nelle+vicinanze')
  elsif v == 'Lazio'
    expect(page).to have_current_path('/announcements?utf8=%E2%9C%93&regione=Lazio&commit=Cerca')
  elsif v == 'filtered'
    expect(page).to have_current_path('/announcements/filter?utf8=✓&prezzo=Crescente&regione=Lazio&categoria=Arredamento&place=&distance_range=50&commit=Applica+filtri')
  elsif v == 'contatti'
    expect(page).to have_current_path('/contatti')
  end
end

When(/^I write (.*) to (.*)$/) do |a, b|
  fill_in(b, with: a)
end

When(/^I select (.*) from (.*)$/) do |a, b|
  find('#' + b).find("option[value='" + a + "']").select_option
end

And(/^I add an image to the announcement$/) do
  attach_file('announcement[immagine_1]', 'test/images/nintendo-switch-lead-09b9f70fe7b0eb176c1ce49cdaed62a21.jpg')
end

And(/^It show the uploaded image$/) do
  id = current_path.split('/').last
  tag = "//img[@src='/uploads/announcement/immagine_1/"+id+"/nintendo-switch-lead-09b9f70fe7b0eb176c1ce49cdaed62a21.jpg']"
  expect(page).to have_xpath(tag)
end

Then(/^Announcement should be deleted$/) do
  expect(Announcement.count).to eq(@ann_count - 1)
end

When(/^I select a region$/) do
  find('#regione').find(:xpath, 'option[8]').select_option
end

Then(/^I should find the announcemnt in that region$/) do
  expect(current_url).to have_content('regione=Lazio')
end
