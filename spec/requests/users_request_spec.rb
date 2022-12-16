require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /index' do
   before do
    get '/users/'
   end

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'should render index' do
      expect(response).to render_template(:index)
    end
  end

  describe 'GET /show' do
    before do
      get '/users/:id'
    end

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end
  
    it 'should render show' do
      expect(response).to render_template(:show)
    end
  end
  
end
