require 'rails_helper'

RSpec.describe User, :type => :model do
  context 'validation' do
    it { should validate_presence_of(:email) }
  end
  context 'association' do
    it { should have_many(:images) }
    it { should have_many(:categories) }
    it { should have_many(:likes) }
    it { should have_many(:follows) }
    it { should have_many(:activities) }
  end
  context 'creation' do
    before(:all) do
      @user = create(:valid_user)
    end

    it "is valid with valid attributes" do
      expect(@user).to be_valid
    end

    it "is valid without name" do
      expect(user2 = build(:valid_user, email: Faker::Internet::email, name: nil)).to be_valid
    end

    it "is not with not uniq email" do
      expect(user2 = build(:valid_user)).to_not be_valid
    end

    it "is not valid withoit password" do
      expect(user2 = build(:valid_user, password: nil)).to_not be_valid
    end

    it "is not valid withoit password confirmation" do
      expect(user2 = build(:valid_user, password_confirmation: nil)).to_not be_valid
    end
  end
end

# require 'rails_helper'
#
# RSpec.describe User, :type => :model do
#   context 'creation' do
#     let(:user) { create :valid_user }
#     let(:no_email_user) { build :user_without_email }
#     let(:no_password_user) { build :user_without_password }
#     let(:no_name_user) { build :user_without_name }
#
#     it "is valid with valid attributes" do
#       expect(user).to be_valid
#     end
#     it "with not uniq email" do
#       expect(user).to be_valid
#       expect(user2 = build(:valid_user)).to_not be_valid
#     end
#
#     it "is not valid without email" do
#       expect(no_email_user).not_to be_valid
#     end
#
#     it "is not valid withoit password" do
#       expect(no_password_user).to_not be_valid
#
#     end
#
#     it "is valid without name" do
#       expect(no_name_user).to be_valid
#     end
#   end
# end

