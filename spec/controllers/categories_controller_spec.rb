require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do
  let!(:user) { create(:valid_user) }
  let!(:category) { create(:valid_category) }
  # subject {create(:valid_category)}
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

    context 'GET #index' do
      it "returns successful response" do
        sign_in user
        get :index
        expect(response).to be_successful
      end
      it "creates activity record with 'showing_index_category' action" do
        sign_in user
        get :index
        expect(Activity.last.action).to eq("showing_index_category")
      end
    end

    context 'GET #show' do
      it "returns successful response" do
        sign_in user
        get :show, params: { id: category.id }
        expect(response).to be_successful
      end
      it "returns successful response" do
        sign_in user
        get :show, params: { id: category.id }
        expect(response).to be_successful
      end

      it "creates .activity record with 'showing_index_category' action" do
        sign_in user
        get :show, params: { id: category.id }
        expect(Activity.last.action).to eq("showing_category_#{category.slug}")
      end
    end

    context 'GET #new' do
      it "returns successful response" do
        sign_in user
        get :new
        expect(response).to be_successful
      end
    end

    context 'create' do
      it "increases category counter by 1" do
        sign_in user
        expect { create(:valid_category ) }.to change { Category.count }.by(1)
      end
      # it "increases current user category counter by 1" do
      #   sign_in user
      #   expect { subject }.to change { user.categories.count }.by(1)
      # end

    end
    # context '#create' do
    #   it "creates .activity record with 'cat_creation' action" do
    #     sign_in user
    #     subject { post :create, category }
    #     puts Activity.count
        # expect(Activity.last.action).to eq("cat_creation")

  end
end
