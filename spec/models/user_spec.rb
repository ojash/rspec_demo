require 'rails_helper'

RSpec.describe User, :type => :model do
  let!(:user1) { create(:user, gender: 'male') }
  let!(:user2) { create(:user, gender: 'female') }
  let!(:user3) { create(:user, gender: 'male') }

  subject { build(:user) }
  it { is_expected.to have_many(:photos) }

  it { is_expected.to allow_value('male').for(:gender) }
  it { is_expected.to allow_value('female').for(:gender) }
  it { is_expected.to_not allow_value('other').for(:gender) }
  it { is_expected.to validate_presence_of(:name) }

  describe '.get_gender' do
    it 'gets all the user with defined gender' do
      a =  User.get_gender('male')
      expect(a.to_a).to eql([user1,user2])
    end
  end

  describe '#total_photos' do
    let!(:photo1) { create(:photo, user_id: user1.id)}
    let!(:photo2) { create(:photo, user_id: user1.id)}
    it 'gets the total photos of the user' do
      a = user1.total_photos
      expect(a).to eql(3)
    end
  end
end
