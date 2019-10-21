# require 'rails_helper'

RSpec.describe ActiveAdmin::CategoriesController, type: :controller do
  render_views
  let!(:admin_user) { create(:valid_admin_user) }
  let!(:user) { create(:valid_user) }
  let!(:category) { create(:valid_category) }
  let!(:image) { create(:valid_image) }

  context '121' do
    it '21321' do
      puts AdminUser.count
      puts AdminUser.last.email
      puts User.count
      sign_in admin_user
      visit admin_categories_path
      puts response.status
      print page.html
      expect(page).to have_content(image.title)

      # get :dashboard
      print page.html
    end
  end
end
