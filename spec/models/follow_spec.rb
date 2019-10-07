# require 'rails_helper'
require 'spec_helper'
RSpec.describe Follow, type: :model do
  let!(:user) { create(:valid_user) }
  let!(:category) { create(:valid_category) }
  let!(:follow) { create(:valid_follow) }

  context 'association' do
    it { expect(follow).to belong_to(:user) }
    it { expect(follow).to belong_to(:category) }
  end

  context 'createion' do
    it "is valid with valid attributes" do
      expect(follow).to be_valid
    end
  end

  context 'deleting' do
    it "count of follows became less on 1" do
      expect { follow.destroy }.to change { Follow.count }.by(-1)
    end
  end
end
