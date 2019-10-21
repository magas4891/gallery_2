describe ActiveAdmin::DashboardController, type: :controller do
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
      print page.html
      get :dashboard
      print page.html
    end
  end
  context 'not signed-in' do
    context 'dashboard' do
      xit 'will redirect to logins page' do
        get :dashboard
        expect(response).to redirect_to('http://test.host/admin/login')
      end
    end
  end

  context 'admin user' do
    before do
      sign_in admin_user
    end
    context 'dashboard' do
      xit 'should return 10 last images' do
        # visit admin_dashboard_path
        # print page.html
        # expect(response).to be_ok
        expect(page).to have_content(image.title)
      end
    end
  end
end
