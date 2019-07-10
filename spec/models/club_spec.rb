require 'rails_helper'

RSpec.describe Club, type: :model do
  describe 'Associations' do
    # it {should have_one(:image)}
    it {should belong_to(:user)}
    it {should belong_to(:event)}
  end
end