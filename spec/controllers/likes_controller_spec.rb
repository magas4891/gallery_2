RSpec.describe LikesController, type: :controller do
  let!(:user) { create(:valid_user) }
  let!(:category) { create(:valid_category) }
  let!(:image) { create(:valid_image) }
  let!(:like) { create(:valid_like) }

  before do
    sign_in user
  end

  context '#create' do
    it 'increases db .Like counter' do
      expect { create(:valid_like) }.to change { Like.count }.by(1)
    end
  end

  context '#delete' do
    it 'decrease db .Like counter' do
      expect { like.destroy }.to change { Like.count }.by(-1)
    end
  end
end
