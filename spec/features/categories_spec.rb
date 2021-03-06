# frozen_string_literal: true

feature 'Category create', driver: :selenium_chrome do
  feature 'with not signing in user' do
    scenario 'should view form for sign_in' do
      visit categories_path
      click_button 'ADD NEW CATEGORY'
      expect(page)
        .to have_content 'You need to sign in or sign up before continuing.'
    end
  end

  feature 'with sign_in user' do
    given(:user) { create(:valid_user) }
    given(:category) { create(:valid_category) }
    before do
      visit new_user_session_path
      within '#new_user' do
        fill_in 'user_email', with: user.email
        fill_in 'user_password', with: 'password'
        click_button 'Login'
      end
      visit categories_path
    end

    scenario 'should view form adding new category' do
      click_button 'ADD NEW CATEGORY'
      expect(page).to have_content 'ADDING NEW CATEGORY'
    end

    scenario 'after creating should appear new category' do
      click_button 'ADD NEW CATEGORY'
      within '#new_category' do
        fill_in 'category_name', with: category.name
        fill_in 'category_description', with: category.description
        click_button 'CREATE'
      end
      # print page.html
      expect(page).to have_content 'Category successful created'
    end

    scenario 'after creating you can visit new category' do
      visit category_path(id: category.slug)
      # print page.html
      expect(page).to have_link 'ADD NEW IMAGE'
    end

    scenario 'you can return back' do
      visit category_path(id: category.slug)
      page.find(:css, 'a[href="/categories?locale=en"]').click
      expect(page).to have_content 'CATEGORIES'
    end
  end
end
