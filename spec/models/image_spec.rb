require 'rails_helper'

RSpec.describe Image, :type => :model do
  context 'creation' do
    before(:each) do
      @user = create(:valid_user)
      @category = create(:valid_category)
    end
    it "is valid with valid attributes" do
      expect(image = create(:valid_image)).to be_valid
    end
    xit "is not valid without title"
    xit "is not valid without category"
    xit "is not valid without owner"
  end
end
