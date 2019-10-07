# require 'rails_helper'
require 'spec_helper'
RSpec.describe ImagesController, type: :controller do
  let!(:user) { create(:valid_user) }
  let!(:category) { create(:valid_category) }
  let!(:image) { create(:valid_image) }

  context 'when user NOT sign in' do
    context 'GET #index' do
      it "returns successful response" do
        get :index
        expect(response).to be_successful
      end
      it "NOT creates any .activity record" do
        get :index
        expect(Activity.count).to eq(0)
      end
    end

    context 'GET #show' do
      it "returns successful response" do
        get :show, params: { id: image.id }
        expect(response).to be_successful
      end
      it "NOT creates any .activity record" do
        get :show, params: { id: image.id }
        expect(Activity.count).to eq(0)
      end
    end

    context 'GET #new' do
      it "redirects to sigh_in form" do
        get :new
        expect(response).to redirect_to("http://test.host/users/sign_in")
      end
      it "NOT creates any .activity record" do
        get :new
        expect(Activity.count).to eq(0)
      end
    end
  end

  context 'when user sign in' do
    before do
      sign_in user
    end

    context 'GET #index' do
      it "returns successful response" do
        get :index
        expect(response).to be_successful
      end

      it "creates activity record with 'showing_index_images' action" do
        get :index
        expect(Activity.last.action).to eq("showing_index_images")
      end
    end

    context 'GET #show' do
      it "returns successful response" do
        get :show, params: { id: image.id }
        expect(response).to be_successful
      end

      it "creates .activity record with 'showing_image' action" do
        get :show, params: { id: image.id }
        expect(Activity.last.action).to eq("showing_image_#{image.id}")
      end
    end

    context 'GET #new' do
      it "returns successful response" do
        get :new
        expect(response).to be_successful
      end
    end

    context '#create' do
      before do
        post :create, params: { image: { :title => Faker::Lorem.word,
                                            :user_id => user.id,
                                            :category_id => category.id,
                                            :picture => Rack::Test::UploadedFile.new(Rails.root.join('spec/support/logo_image.jpg'), 'image/jpeg')} }
      end

      it "after #create redirect to image" do
        expect(response).to redirect_to("http://test.host/images/#{Image.last.id}?locale=en")
      end

      it "creates .activity 'cat_ctreation' after creation" do
        expect(Activity.last.action).to eq("img_creation")
      end

      it "increases category counter by 1" do
        expect { create(:valid_image) }.to change { Image.count }.by(1)
      end
    end

    context "if #create fails" do
      before do
        post :create, params: { image: { :title => "1111111111111111",
                                         :user_id => user.id,
                                         :category_id => category.id,
                                         :picture => nil} }
      end
      it "render template #new'" do
        expect(response).to render_template(:new)
      end
    end

    context "#destroy" do
      it "#delete database record" do
        expect { image.destroy }.to change { Image.count }.by(-1)
      end

      it "redirects to 'categories/index'" do
        delete :destroy, params: { :id => Image.last.id, :category_id => category.id }
        expect(response).to redirect_to(categories_path)
      end
    end
  end
end
