require 'rails_helper'

RSpec.describe Category, type: :model do
  context 'associations' do
    it { should belong_to(:user) }
  end
  context 'creation' do
    before(:all) do
      @user = create(:valid_user)
    end
    it "is valid with valid attributes" do
      expect(category = create(:valid_category)).to be_valid
    end

    it "is not valid without user" do
      expect(category = build(:valid_category, user_id: nil)).to_not be_valid
    end

    it "is not valid without name" do
      expect(category = build(:valid_category, name: nil )).to_not be_valid
    end

    it "is valid without description" do
      expect(category = build(:valid_category, description: nil )).to be_valid
    end
  end
end
