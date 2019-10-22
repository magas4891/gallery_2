# frozen_string_literal: true

feature 'AdminUser', driver: :selenium_chrome do
  given(:admin_user) { create(:valid_admin_user) }

  scenario 'login should be fail with incorrect data' do
    sign_up_with admin_user.email, 'drowssap'
    expect(page).to have_content 'Invalid Email or password.'
  end

  scenario 'login should be successful with correct data' do
    sign_up_with admin_user.email, admin_user.password
    expect(page).to have_content 'Signed in successfully.'
  end

  scenario 'login and log_out should be successfully' do
    sign_up_with admin_user.email, admin_user.password
    click_link 'Logout'
    expect(page).to have_content 'You need to sign in or sign up before continuing.'
  end

  scenario 'after login can see dashboard with 10 images' do
    sign_up_with admin_user.email, admin_user.password
    expect(page).to have_content 'Dashboard'
    expect(page).to have_content 'Recently 10 Images'
  end

  scenario 'after parsing shows images from site, with ability to save them' do
    sign_up_with admin_user.email, admin_user.password
    visit admin_parser_path
    fill_in 'parser_url', with: 'http://fit4brain.com/'
    click_button 'Submit Parser'
    expect(page).to have_css 'img'
    expect(page).to have_button 'Save'
  end
end

def sign_up_with(email, password)
  visit new_admin_user_session_path
  within '#session_new' do
    fill_in 'admin_user_email', with: email
    fill_in 'admin_user_password', with: password
    click_button 'Login'
  end
end
