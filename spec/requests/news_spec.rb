require 'rails_helper'

RSpec.describe NewsController, type: :controller do
  describe 'Event controller request specs' do
    binding.pry
    login_user

    context 'GET #index' do
      it 'should success and render to index page' do
        get :index
        expect(response).to have_http_status(200)
        expect(response).to render_template :index
      end
    end


    #  context 'GET #show' do
    #   let!(:product) { create :product }

    #  it 'should success and render to edit page' do
    #     get :show, params: { id: product.id }
    #     expect(response).to have_http_status(200)
    #     expect(response).to render_template :edit
    #    end
    #   end
  end
end