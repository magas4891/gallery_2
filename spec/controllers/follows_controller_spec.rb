
RSpec.describe LikesController, type: :controller do
  let!(:user) { create(:valid_user) }
  let!(:category) { create(:valid_category) }
  let!(:follow) { create(:valid_follow) }

  before do
    sign_in user
  end

  context '#create' do
    it "increases db .Follow counter" do
      expect { create(:valid_follow) }.to change { Follow.count }.by(1)
    end
  end

  context '#delete' do
    it "decrease db .Follow counter" do
      expect { follow.destroy }.to change { Follow.count }.by(-1)
    end
  end
end
