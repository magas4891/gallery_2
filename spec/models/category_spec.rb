require 'rails_helper'

RSpec.describe Category, :type => :model do
  context 'creation' do
    # before(:all) do
      # @user = create(:valid_user)
      # @user.should be_an_instance_of User
    # end
    it "is valid with valid attributes" do
      user = create(:valid_user)
      expect(category = create(:valid_category)).to be_valid
    end

    it "is not valid without user" do
      expect(category = build(:valid_category)).to_not be_valid
    end

    it "is valid without name" do
      user = create(:valid_user)
      expect(category = build(:valid_category, name: nil )).to_not be_valid
    end

    it "is valid without description" do
      user = create(:valid_user)
      expect(category = build(:valid_category, description: nil )).to_not be_valid
    end
  end
end
