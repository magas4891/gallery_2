require 'rails_helper'

RSpec.describe Image, :type => :model do
  context 'validation' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:picture) }
  end
  context 'associations' do
    it { should belong_to(:category) }
    it { should belong_to(:user) }
    it { should have_many(:comments) }
    it { should have_many(:likes) }
  end
  context 'creation' do
    before(:all) do
      @user = create(:valid_user)
      @category = create(:valid_category)
    end
    it "is valid with valid attributes" do
      expect(image = create(:valid_image)).to be_valid
    end
  end
end
