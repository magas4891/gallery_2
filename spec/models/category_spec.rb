require 'rails_helper'

RSpec.describe Category, type: :model do
  let!(:user) { create(:valid_user) }
  let!(:category) { create(:valid_category) }

  context 'associations' do
    it { expect(category).to belong_to(:user) }
    it { expect(category).to have_many(:images).dependent(:destroy) }
    it { expect(category).to have_many(:follows).dependent(:destroy) }
  end

  context 'validations' do
    it { expect(category).to validate_presence_of(:name) }
    it { expect(category).to validate_length_of(:name).is_at_least(1) }
  end

  context 'creation' do

    it "is valid with valid attributes" do
      expect(category).to be_valid
    end

    it "is valid without description" do
      expect(category = build(:valid_category, description: nil)).to be_valid
    end
  end

  context 'deleting' do
    it "count of categories became less on 1" do
      expect { category.destroy }.to change { Category.count }.by(-1)
    end
  end
end
