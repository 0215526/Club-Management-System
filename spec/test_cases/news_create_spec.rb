require 'rails_helper'

describe 'News' do
  context 'with valid params' do
    let!(:params) {
      {
          news: {
              title: 'akdjlkaf',
              body: 'kjfdslj'
          }
      }
    }

    it 'will create a news' do
      binding.pry
      post news_path, params: params
      binding.pry
      expect(status).to eq(200)
    end
  end
end