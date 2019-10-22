# frozen_string_literal: true

RSpec.describe Activity, type: :model do
  let!(:user) { create(:valid_user) }
  let!(:activity) { create(:valid_activity) }

  context 'association' do
    it { expect(activity).to belong_to(:user) }
  end

  context 'creation' do
    it 'is valid with valid attributes' do
      expect(activity).to be_valid
    end
  end

  context 'deleting' do
    it 'count of activitys became less on 1' do
      expect { activity.destroy }.to change { Activity.count }.by(-1)
    end
  end
end
