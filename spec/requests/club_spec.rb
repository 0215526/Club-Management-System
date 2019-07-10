require 'rails_helper'

RSpec.describe ClubsController, type: :controller do
  describe 'Club controller request specs' do
    login_user

    let!(:event) { FactoryBot.create(:event) }
    let!(:news) { FactoryBot.create(:news) }

  end
end