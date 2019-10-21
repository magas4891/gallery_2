
describe Admin::ParserController, type: :controller do
  render_views
  let!(:admin_user) { create(:admin_user) }
  context 'not signed-in' do
    context 'parser' do
      it 'redirects to login page' do
        post :grab, params: { parser: { :url => 'http://fit4brain.com/' } }
        expect(response).to redirect_to('http://test.host/admin/login')
      end
    end
  end

  context 'admin user' do
    before { sign_in admin_user }

    context 'parser' do
      it 'return status' do
        post :grab, params: { parser: { :url => 'http://fit4brain.com/' } }
        expect(response).to have_http_status(:redirect)
      end
    end
  end
end


