require 'spec_helper'

feature 'Login Fail', driver: :selenium_chrome do

  given(:user) { create(:valid_user) }

  before { visit new_user_session_path }

  scenario 'should be successful' do
    within '#new_user' do
      fill_in 'user_email', with: user.email
      fill_in 'user_password', with: 'password'
      click_button 'Login'
    end
    expect(page).to have_content 'Signed in successfully.'
  end

  scenario 'should be fail' do
    within '#new_user' do
      fill_in 'user_email', with: user.email
      fill_in 'user_password', with: 'drowssap'
      click_button 'Login'
    end
    expect(page).to have_content 'Signed in successfully.'
  end
end
