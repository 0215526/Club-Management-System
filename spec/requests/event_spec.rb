require 'rails_helper'

RSpec.describe EventsController, type: :controller do
  describe 'Events controller request specs' do
    # binding.pry
    login_user

    context 'GET #index' do
      it 'should success and render to index page' do
        get :index
        expect(response).to have_http_status(200)
        expect(response).to render_template :index
      end
    end

    context 'GET #new' do
      it 'should success and render to new page' do
        get :new
        expect(response).to have_http_status(200)
        expect(response).to render_template :new
      end
    end

    context 'GET #edit' do
      let!(:event) { FactoryBot.create(:event) }
      it 'should success and render to edit page' do
        get :edit, params: { id: event.id}
        expect(response).to have_http_status(200)
        expect(response).to render_template :edit
      end
    end

    # context 'POST #create' do
    #   it 'should create an event and display a success notice' do
    #     params =   {
    #         titl: "New Events",
    #         body: "<div>Ruby on Rails is not a minimalist framework, ...",
    #         image: "/assets/images/bg.jpg"
    #     }
    #     expect { post(:create, params: { news: params }) }.to change(News, :count).by(1)
    #     expect(flash[:notice]).to eq 'News was successfully created.'
    #   end
    # end

    context 'GET #show' do
      let!(:event) { FactoryBot.create(:event) }
      it 'should display the details of a particular news' do
        get :show, params: { id: event.id }
        expect(response).to have_http_status(200)
        expect(response).to render_template :show
      end
    end

    context 'PUT #update' do
      let!(:event) { FactoryBot.create(:event) }
      it 'should update an existing news and display a success notice' do
        params = {
            name: 'Test News Updated',
        }
        put(:update, params: { id: event.id, event: params })
        event.reload
        params.keys.each do |key|
          expect(event.attributes[key.to_s]).to eq params[key]
        end
        expect(flash[:notice]).to eq 'Event was successfully updated.'
      end
    end

    context 'DELETE #destroy' do
      let!(:event) { FactoryBot.create(:event) }
      it 'should delete a news and display a success notice' do
        expect { delete :destroy, params: { id: event.id } }.to change(Event, :count).by(-1)
        expect(flash[:notice]).to eq 'Event was successfully destroyed.'
      end
    end
  end
end