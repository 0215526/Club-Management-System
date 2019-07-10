require 'rails_helper'

RSpec.describe News, type: :model do
  describe 'Associations' do
    # it {should have_one(:image)}
    it {should belong_to(:user)}
  end
  describe 'validation' do
    it {should validate_presence_of(:body)}
    it {should validate_presence_of(:title)}
    it {should validate_length_of(:body).is_at_least(32)}
    it {should validate_length_of(:title).is_at_least(3)}
    it {should validate_uniqueness_of(:title)}
  end
end