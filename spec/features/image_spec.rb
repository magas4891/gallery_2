require 'spec_helper'

feature 'Image,', driver: :selenium_chrome do
  feature 'with not signing in user' do
    given!(:user) { create(:valid_user) }
    given!(:category) { create(:valid_category) }
    given!(:image) { create(:valid_image) }

    scenario 'can be show' do
      visit categories_path
      visit category_path(:id => category.slug)
      visit image_path(:id => image.id)
      expect(page).to have_selector 'img'
    end

    scenario 'can not leave comment' do
      visit categories_path
      visit category_path(:id => category.slug)
      visit image_path(:id => image.id)
      expect(page).to have_no_css 'comment_text'
    end

    scenario 'should view form for sign_in' do
      visit categories_path
      visit category_path(:id => category.slug)
      click_link 'ADD NEW IMAGE'
      expect(page).to have_content 'You need to sign in or sign up before continuing.'
    end
  end

  feature 'with sign_in user' do
    given!(:user) { create(:valid_user) }
    given!(:category) { create(:valid_category) }
    given!(:image) { create(:valid_image) }

    before { visit new_user_session_path
            within '#new_user' do
              fill_in 'user_email', with: user.email
              fill_in 'user_password', with: 'password'
              click_button 'Login'
            end
            visit categories_path
            visit category_path(:id => category.slug)
            }

    scenario 'should view form adding new category' do
      click_link 'ADD NEW IMAGE'
      expect(page).to have_content 'ADDING NEW IMAGE'
    end

    scenario 'after creating should appear new category' do
      click_link 'ADD NEW IMAGE'
      within '#new_image' do
        fill_in 'image_title', with: image.title
        attach_file 'image_picture', '/home/developer/RoR/gallery_2/spec/support/logo_image.jpg'
        click_button 'UPLOAD'
      end
      expect(page).to have_selector 'img'
    end

    scenario 'after creating you can visit new category' do
      visit category_path(:id => category.slug)
      expect(page).to have_link 'ADD NEW IMAGE'
    end

    scenario 'you can follow the category' do
      visit category_path(:id => category.slug)
      page.find(:css, "a[href='/categories/#{category.slug}/follows?locale=en']").click
      expect(page).to have_selector '#follow', text: '1'
    end

    scenario 'you can unfollow the category' do
      visit category_path(:id => category.slug)
      page.find(:css, "a[href='/categories/#{category.slug}/follows?locale=en']").click
      page.find(:css, "a[href='/categories/#{category.slug}/follows/#{category.slug}?locale=en']").click
      expect(page).to have_selector '#follow', text: '0'
    end

    scenario 'you can return back' do
      visit category_path(:id => category.slug)
      page.find(:css, 'a[href="/categories?locale=en"]').click
      expect(page).to have_content 'CATEGORIES'
    end
  end
end


