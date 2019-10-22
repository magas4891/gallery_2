# frozen_string_literal: true

feature 'Like,', driver: :selenium_chrome do
  feature 'with not signing in user' do
    given!(:user) { create(:valid_user) }
    given!(:category) { create(:valid_category) }
    given!(:image) { create(:valid_image) }
    given!(:like) { create(:valid_like) }

    scenario 'can be show' do
      visit categories_path
      visit category_path(id: category.slug)
      visit image_path(id: image.id)
      expect(page).to have_selector '.like_items', text: '1'
    end

    scenario 'should view form for sign_in' do
      visit categories_path
      visit category_path(id: category.slug)
      visit image_path(id: image.id)
      find('#like').click
      expect(page)
        .to have_content 'You need to sign in or sign up before continuing.'
    end
  end

  feature 'with sign_in user' do
    given!(:user) { create(:valid_user) }
    given!(:category) { create(:valid_category) }
    given!(:image) { create(:valid_image) }
    given(:like) { create(:valid_like) }

    before do
      visit new_user_session_path
      within '#new_user' do
        fill_in 'user_email', with: user.email
        fill_in 'user_password', with: 'password'
        click_button 'Login'
      end
      visit categories_path
      visit category_path(id: category.slug)
      visit image_path(id: image.id)
    end

    scenario 'should view counter of existing likes' do
      expect(page).to have_selector '.like_items', text: '0'
    end

    scenario 'after liked it should chang like counter by 1' do
      find('#like').click
      expect(page).to have_selector '.like_items', text: '1'
    end

    scenario 'after liked it should change image' do
      find('#like').click
      expect(page).to have_selector 'a#unlike'
    end

    scenario 'after liked it you can unlike it' do
      find('#like').click
      find('#unlike').click
      expect(page).to have_selector '.like_items', text: '0'
    end

    scenario 'after liked it and unlike it shold change image' do
      find('#like').click
      find('#unlike').click
      expect(page).to have_selector 'a#like'
    end
  end
end
