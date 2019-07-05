require 'rails_helper'

RSpec.describe NewsController, type: :controller do
  describe  "create a news" do
    let!(:params) {
      {
          news: {
              title: 'akdjlkaf',
              body: 'kjfdslj'
          }
      }
    }

    it 'will create a news' do
      post :create, params: params
      binding.pry
      expect(status).to eq(200)
    end

    it 'valid parmas' do
      get :index
      binding.pry
      expect(response).to be_successful
    end
  end
end