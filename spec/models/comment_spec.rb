# frozen_string_literal: true

RSpec.describe Comment, type: :model do
  let!(:user) { create(:valid_user) }
  let!(:category) { create(:valid_category) }
  let!(:image) { create(:valid_image) }
  let!(:comment) { create(:valid_comment) }

  context 'association' do
    it { expect(comment).to belong_to(:user) }
    it { expect(comment).to belong_to(:image) }
  end

  context 'creation' do
    it 'is valid with valid attributes' do
      expect(comment).to be_valid
    end
  end

  context 'deleting' do
    it 'count of comments became less on 1' do
      expect { comment.destroy }.to change { Comment.count }.by(-1)
    end
  end
end
