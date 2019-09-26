require 'rails_helper'

RSpec.describe Like, type: :model do
  let!(:like) { create(:valid_like) }

  context 'association' do
    it { expect(like).to belong_to(:user) }
    it { expect(like).to belong_to(:image) }
  end

  context 'createion' do
    it "is valid with valid attributes" do
      expect(like).to be_valid
    end
  end

  context 'deleting' do
    it "count of likes became less on 1" do
      expect { like.destroy }.to change { Like.count }.by(-1)
    end
  end
end
