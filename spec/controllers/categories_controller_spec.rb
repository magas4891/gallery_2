# require 'rails_helper'
require 'spec_helper'
RSpec.describe CategoriesController, type: :controller do
  let!(:user) { create(:valid_user) }
  let!(:category) { create(:valid_category) }

  let!(:image) { create(:valid_image) }
  let!(:like) { create(:valid_like) }
  let!(:comment) { create(:valid_comment) }

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
        get :show, params: { id: category.id }
        expect(response).to be_successful
      end
      it "NOT creates any .activity record" do
        get :show, params: { id: category.id }
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
        puts category.slug
      end
      it "creates activity record with 'showing_index_category' action" do
        get :index
        expect(Activity.last.action).to eq("showing_index_category")
      end
    end

    context 'GET #show' do
      it "returns successful response" do
        get :show, params: { id: category.id }
        expect(response).to be_successful
      end

      it "creates .activity record with 'showing_category' action" do
        get :show, params: { id: category.id }
        expect(Activity.last.action).to eq("showing_category_#{category.slug}")
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
        post :create, params: { category: { :name => Faker::DcComics.hero,
                                            :description => Faker::ChuckNorris.fact,
                                            :user_id => user.id } }
      end

      it "increases category counter by 1" do
        expect { create(:valid_category) }.to change { Category.count }.by(1)
      end

      it "creates .activity 'cat_ctreation' after creation" do
        expect(Activity.last.action).to eq("cat_creation")
      end

      it "after #create redirect to 'categories/index'" do
        expect(response).to redirect_to(categories_path)
      end

      it "if #create fails, render template #new'" do
        post :create, params: { category: { :name => nil,
                                            :description => nil,
                                            :user_id => nil } }
        expect(response).to render_template(:new)
      end
    end

    context "#destroy" do
      it "#delete database record" do
        expect { category.destroy }.to change { Category.count }.by(-1)
      end

      it "redirects to 'categories/index'" do
        delete :destroy, params: { :id => Category.last.id }
        expect(response).to redirect_to(categories_path)
      end
    end

    context "#TOP CATEGORIES" do
      xit "do something" do
        # puts User.count
        # puts user.name
        # puts Category.count
        # puts category.name
        # puts category.user.name
        # puts Image.count
        # puts image.title
        # puts image.category.name
        # puts image.user.name
        # puts Like.count
        # puts like.user.name
        # puts like.image.title
        puts category.images.count
        puts image.likes.count
        # expect { get :top }.to change { category.rank }.by(2)
      end
    end
  end
end
