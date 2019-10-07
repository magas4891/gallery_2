require 'spec_helper'

feature 'Follow,', driver: :selenium_chrome do
  feature 'with not signing in user' do
    given!(:user) { create(:valid_user) }
    given!(:category) { create(:valid_category) }
    given!(:follow) { create(:valid_follow) }

    scenario 'can be show' do
      visit categories_path
      visit category_path(:id => category.slug)
      expect(page).to have_selector '.category_follow', text: '1'
    end

    scenario 'should view form for sign_in' do
      visit categories_path
      visit category_path(:id => category.slug)
      find('#follow').click
      expect(page).to have_content 'You need to sign in or sign up before continuing.'
    end
  end

  feature 'with sign_in user' do
    given!(:user) { create(:valid_user) }
    given!(:category) { create(:valid_category) }
    given!(:image) { create(:valid_image) }
    given(:follow) { create(:valid_follow) }

    before do
      visit new_user_session_path
      within '#new_user' do
        fill_in 'user_email', with: user.email
        fill_in 'user_password', with: 'password'
        click_button 'Login'
      end
      visit categories_path
      visit category_path(:id => category.slug)
    end


    scenario 'should view counter of existing follows' do
      expect(page).to have_selector '.category_follow', text: '0'
    end

    scenario 'after followed it should chang follows counter by 1' do
      find('#follow').click
      expect(page).to have_selector '.category_follow', text: '1'
    end

    scenario 'after followed it should change image' do
      find('#follow').click
      expect(page).to have_selector 'a#unfollow'
    end

    scenario 'after followed it you can unfollow it' do
      find('#follow').click
      find('#unfollow').click
      expect(page).to have_selector '.category_follow', text: '0'
    end

    scenario 'after followed it and unfollow it should change image' do
      find('#follow').click
      find('#unfollow').click
      expect(page).to have_selector 'a#follow'
    end
  end
end


