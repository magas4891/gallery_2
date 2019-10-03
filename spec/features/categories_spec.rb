# require 'rails_helper'
require 'spec_helper'

feature 'Login Fail', driver: :selenium_chrome do

  given(:user) { create(:valid_user) }

  before { visit new_user_session_path }

  scenario 'should bi successful' do
    within '#new_user' do
      fill_in 'user_email', with: user.email
      fill_in 'user_password', with: 'password'
      click_button 'Login'
    end
    expect(page).to have_content 'Signed in successfully.'

      # within(%form) do
    #   expect(page).to have_content('ADD NEW CATEGORY')
    #   end
    # click_button 'CREATE'
    # expect(page).to have_content('Category successful created')
  end
end

# # frozen_string_literal: true
#
# require 'spec_helper'
#
# feature 'Login Fail', driver: :selenium_chrome do
#
#   given(:user) { create(:valid_user) }
#
#   before { visit new_user_session_path }
#
#   scenario 'Visitor login failure via register form' do
#
#     within '#new_user' do
#       fill_in 'user[email]', with: ''
#       fill_in 'user[password]', with: ''
#       click_button('Log in')
#     end
#
#     expect(page).to have_content 'Invalid Email or password.'
#   end
