feature 'Image,', driver: :selenium_chrome do
  feature 'with not signing in user' do
    given!(:user) { create(:valid_user) }
    given!(:category) { create(:valid_category) }
    given!(:image) { create(:valid_image) }

    scenario 'can be show' do
      visit categories_path
      visit category_path(id: category.slug)
      visit image_path(id: image.id)
      expect(page).to have_selector 'img'
    end

    scenario 'should view form for sign_in' do
      visit categories_path
      visit category_path(id: category.slug)
      click_link 'ADD NEW IMAGE'
      expect(page)
        .to have_content 'You need to sign in or sign up before continuing.'
    end
  end

  feature 'with sign_in user' do
    given!(:user) { create(:valid_user) }
    given!(:category) { create(:valid_category) }
    given!(:image) { create(:valid_image) }

    before do
      visit new_user_session_path
      within '#new_user' do
        fill_in 'user_email', with: user.email
        fill_in 'user_password', with: 'password'
        click_button 'Login'
      end
      visit categories_path
      visit category_path(id: category.slug)
    end

    scenario 'should view form adding new image' do
      click_link 'ADD NEW IMAGE'
      expect(page).to have_content 'ADDING NEW IMAGE'
    end

    scenario 'after creating should show new image' do
      click_link 'ADD NEW IMAGE'
      within '#new_image' do
        fill_in 'image_title', with: image.title
        attach_file 'image_picture',
                    '/home/developer/RoR/gallery_2/spec/support/logo_image.jpg'
        click_button 'UPLOAD'
      end
      expect(page).to have_selector 'img'
    end

    scenario 'you can return back' do
      visit image_path(id: image.id)
      page.find(:css, "a[class='button-back']").click
      expect(page).to have_content category.name.upcase
    end
  end
end
