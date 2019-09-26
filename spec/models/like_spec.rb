require 'rails_helper'

RSpec.describe Like, type: :model do
  context 'association' do
    it { should belong_to(:user) }
    it { should belong_to(:image) }
  end
  # before(:all) do
  #   @user = create(:valid_user)
  #   @category = create(:valid_category)
  #   @image = create(:valid_image)
  # end
  let(:like) { create(:valid_like) }
  context 'createion' do
    it "is valid with valid attributes" do
      expect(like = create(:valid_like)).to be_valid
    end
  end
end
