require 'rails_helper'

describe 'News' do
  let!(:user) {create(:user)}
  # let!(:token) {binding.pry; user_token(user)}

  it 'create a news' do
    post news_index_path, params: {news: {title: 'dummy title', body: 'lkdjfaslkfjfs'}}
    binding.pry
    expect(status).to eq(200)
  end
end