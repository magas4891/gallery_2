require 'rails_helper'

RSpec.describe Category, type: :model do
  context 'associations' do
    it { should belong_to(:user) }
    it { should have_many(:images).dependent(:destroy) }
    it { should have_many(:follows).dependent(:destroy) }
  end

  context 'validations' do
    it { should validate_presence_of(:name)}
    it { should validate_length_of(:name).is_at_least(1) }
  end

  context 'creation' do
    before(:all) do
      @user = create(:valid_user)
    end

    it "is valid with valid attributes" do
      expect(category = create(:valid_category)).to be_valid
    end

    it "is valid without description" do
      expect(category = build(:valid_category, description: nil )).to be_valid
    end
  end
end
