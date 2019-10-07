require 'spec_helper'

feature 'Login', driver: :selenium_chrome do

  given(:user) { create(:valid_user) }

  before { visit new_user_session_path }

  scenario 'should authentificate with Omniauth' do
    print page.html
    find("a[class='login100-social-item bg1']").click
    expect(page).to have_content 'Successfully authenticated from Facebook account.'
  end

  # scenario 'should be successful with correct data' do
  #   within '#new_user' do
  #     fill_in 'user_email', with: user.email
  #     fill_in 'user_password', with: 'password'
  #     click_button 'Login'
  #   end
  #   expect(page).to have_content 'Signed in successfully.'
  # end
  #
  # scenario 'and log_out' do
  #   within '#new_user' do
  #     fill_in 'user_email', with: user.email
  #     fill_in 'user_password', with: 'password'
  #     click_button 'Login'
  #   end
  #   visit categories_path
  #   # sleep(3)
  #   # save_and_open_screenshot
  #   click_link 'USER MENU'
  #   click_link 'Logout'
  #   expect(page).to have_content 'Signed out successfully.'
  # end
  #
  # scenario 'should be fail with incorrect data' do
  #   within '#new_user' do
  #     fill_in 'user_email', with: user.email
  #     fill_in 'user_password', with: 'drowssap'
  #     click_button 'Login'
  #   end
  #   expect(page).to have_content 'Invalid Email or password.'
  # end
end
