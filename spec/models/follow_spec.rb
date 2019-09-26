require 'rails_helper'

RSpec.describe Follow, type: :model do
  context 'association' do
    it { should belong_to(:user) }
    it { should belong_to(:category) }
  end
  # before(:all) do
  #   @user = create(:valid_user)
  #   @category = create(:valid_category)
  #   @image = create(:valid_image)
  # end
  let(:follow) { create(:valid_follow) }
  context 'createion' do
    it "is valid with valid attributes" do
      expect(follow = create(:valid_follow)).to be_valid
    end
  end
end
