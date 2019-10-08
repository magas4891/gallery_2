require 'spec_helper'

describe Admin::ParserController, type: :controller do
  render_views
  let!(:admin_user) { create(:admin_user) }
  let!(:user) { create(:valid_user) }
  # let(:category) { create(:valid_category) }
  before { sign_in admin_user }

  context 'admin user' do


    #   it 'returns http success' do
  #     get :index
  #     expect(response).to have_http_status(:success)
  #   end

    it 'parser' do
      post :grab, params: { parser: { :url => 'http://fit4brain.com/' } }
      puts response
      # expect(response).to have_http_status(:redirect)
      expect(response).to have_http_status(:success)
    end
  end
end
