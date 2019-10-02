require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  let!(:user) { create(:valid_user) }
  let!(:category) { create(:valid_category) }
  let!(:image) { create(:valid_image) }
  let!(:comment) { create(:valid_comment) }

  context 'when user NOT loged in' do
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
  end

  describe 'when user sign_in' do
    before do
      sign_in user
    end

    context 'GET #index' do
      it "returns successful response" do
        get :index
        expect(response).to be_successful
      end

      it "creates activity record with 'showing_index_comments' action" do
        get :index
        expect(Activity.last.action).to eq("showing_index_comments")
      end
    end

    context 'POST #create' do
      before do
        post :create, params: { image_id: image.id,
                                comment: { :text => Faker::Lorem.sentence(6),
                                           :user_id => user.id }
        }
      end

      it "after #create redirect to this image" do
        expect(response).to redirect_to(image_path(id: image.id))
      end

      it "creates .activity 'comment' after creation" do
        expect(Activity.last.action).to eq("comment")
      end

      it "increases comment counter by 1" do
        expect { create(:valid_comment) }.to change { Comment.count }.by(1)
      end
    end
  end
end



