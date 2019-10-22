# frozen_string_literal: true

RSpec.describe Image, type: :model do
  let!(:user) { create(:valid_user) }
  let!(:category) { create(:valid_category) }
  let!(:image) { create(:valid_image) }

  context 'validation' do
    it { expect(image).to validate_presence_of(:title) }
    it { expect(image).to validate_presence_of(:picture) }
  end

  context 'associations' do
    it { expect(image).to belong_to(:category) }
    it { expect(image).to belong_to(:user) }
    it { expect(image).to have_many(:comments) }
    it { expect(image).to have_many(:likes) }
  end
  context 'creation' do
    it 'is valid with valid attributes' do
      expect(image).to be_valid
    end
  end

  context 'deleting' do
    it 'count of images became less on 1' do
      expect { image.destroy }.to change { Image.count }.by(-1)
    end
  end
end
