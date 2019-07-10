require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'User controller request specs' do
    login_user

    let!(:user){create :user}

    it 'should success and render to index page' do
      get :index
      expect(response).to have_http_status(200)
      expect(response).to render_template :index
    end

    it 'should display the details of a particular user' do
      get :show, params: { id: user.id }
      expect(response).to have_http_status(200)
      expect(response).to render_template :show
    end

    # it 'should success and render to edit page' do
    #   get :user, params: { id: user.id}
    #   expect(response).to have_http_status(200)
    #   expect(response).to render_template :edit
    # end

    it 'should delete a user and display a success notice' do
      expect { delete :destroy, params: { id: user.id } }.to change(User, :count).by(-1)
      expect(flash[:notice]).to eq 'User deleted.'
    end

    it 'should update an existing user and display a success notice' do
      params = {
          first_name: 'Name Updated',
      }
      put(:update, params: { id: user.id, user: params })
      user.reload
      params.keys.each do |key|
        expect(user.attributes[key.to_s]).to eq params[key]
      end
      expect(flash[:success]).to eq 'User Updated Successfully'
    end

  end
end