require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Associations' do
    it {should have_many(:news)}
    it {should have_many(:events)}
    it {should have_many(:clubs)}
    it {should have_many(:events).through(:clubs)}
  end

  describe 'Validations' do
    it {should validate_presence_of(:first_name)}
    it {should validate_presence_of(:last_name)}
    it {should validate_presence_of(:dob)}
    it {should validate_presence_of(:designation)}
    it {should validate_presence_of(:company)}
    it {should validate_presence_of(:address)}
    it {should validate_presence_of(:gender)}
    it {should_not allow_value("blah").for(:email)}
    it {should allow_value("a@b.com").for(:email)}
    it {should validate_length_of(:first_name).is_at_least(3)}
    it {should validate_length_of(:last_name).is_at_least(3)}
    # it {should validate_length_of(:dob).is_at_least(3)}
    it {should validate_length_of(:designation).is_at_least(3)}
    it {should validate_length_of(:company).is_at_least(3)}
    it {should validate_length_of(:address).is_at_least(3)}
  end

  describe 'Full Name' do
    it 'returns the concatenated first and last name' do
      user = build(:user, first_name: 'John', last_name: 'Cena')
      expect(user.full_name).to eq 'John Cena'
    end
  end

  describe 'Admin Type' do
    it 'returns Admin' do
      user = build(:user, admin: true)
      expect(user.admin_type).to eq 'Admin'
    end
    it 'returns User' do
      user = build(:user, admin: false)
      expect(user.admin_type).to eq 'User'
    end
  end
end