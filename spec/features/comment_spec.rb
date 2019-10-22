feature 'Comment,', driver: :selenium_chrome do
  feature 'with not signing in user' do
    given!(:user) { create(:valid_user) }
    given!(:category) { create(:valid_category) }
    given!(:image) { create(:valid_image) }
    given!(:comment) { create(:valid_comment) }

    scenario 'can be show' do
      visit categories_path
      visit category_path(id: category.slug)
      visit image_path(id: image.id)
      expect(page).to have_selector '#comments'
    end

    scenario 'can not leave comment' do
      visit categories_path
      visit category_path(id: category.slug)
      visit image_path(id: image.id)
      expect(page).to have_no_css 'comment_text'
    end
  end

  feature 'with sign_in user' do
    given!(:user) { create(:valid_user) }
    given!(:category) { create(:valid_category) }
    given!(:image) { create(:valid_image) }
    given!(:comment) { create(:valid_comment) }
    given(:comment2) { create(:valid_comment) }

    before  do
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

    scenario 'can be show' do
      expect(page).to have_selector '#comments'
    end

    scenario 'should view form adding new comment' do
      expect(page).to have_selector('.comments_form')
    end

    scenario 'after creating should appear new comment' do
      page.execute_script 'window.scrollBy(0,1000)'
      within '#new_comment' do
        fill_in 'comment_text', with: comment2.text
        click_button 'Create comment'
      end
      find('.comments_form').click
      page.execute_script 'window.scrollBy(0,1000)'
      expect(page).to have_content comment2.text
    end

    scenario 'you can return back' do
      find_link(class: 'button-back').click
      expect(page).to have_content category.name.upcase
    end
  end
end
