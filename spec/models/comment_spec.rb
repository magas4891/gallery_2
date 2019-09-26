require 'rails_helper'

RSpec.describe Comment, type: :model do
  context 'association' do
    it { should belong_to(:user) }
    it { should belong_to(:image) }
  end
  # before(:all) do
  #   @user = create(:valid_user)
  #   @category = create(:valid_category)
  #   @image = create(:valid_image)
  # end
  let(:comment) { create(:valid_comment) }
  context 'creation' do
    it "is valid with valid attributes" do
      expect(comment = create(:valid_comment)).to be_valid
    end
  end
end
