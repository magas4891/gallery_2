# frozen_string_literal: true

RSpec.describe User, type: :model do
  let!(:user) { create(:valid_user) }

  context 'validation' do
    it { expect(user).to validate_presence_of(:email) }
  end

  context 'association' do
    it { expect(user).to  have_many(:images) }
    it { expect(user).to  have_many(:categories) }
    it { expect(user).to  have_many(:likes) }
    it { expect(user).to  have_many(:follows) }
    it { expect(user).to  have_many(:activities) }
  end

  context 'creation' do
    it 'is valid with valid attributes' do
      expect(user).to be_valid
    end

    it 'is valid without name' do
      expect(user = build(:valid_user, name: nil)).to be_valid
    end

    it 'is invalid withnot uniq email' do
      user2 = create(:user_with_not_uniq_email)
      expect(user = build(:valid_user,
                          email: 'bob_smith@gmail.com')).to_not be_valid
    end

    it 'is invalid withoit password' do
      expect(user = build(:valid_user, password: nil)).to_not be_valid
    end

    it 'is invalid withoit password confirmation' do
      expect(user = build(:valid_user,
                          password_confirmation: '121212')).to_not be_valid
    end
  end

  context 'deleting' do
    it 'count of users became less on 1' do
      expect { user.destroy }.to change { User.count }.by(-1)
    end
  end
end
