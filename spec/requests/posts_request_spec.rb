require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      get '/users/:user_id/posts/'
      expect(response).to have_http_status(:success)
    end

    it 'should render index' do
      get '/users/:user_id/posts/:id'
      expect(response).to render_template(:index)
    end
  end

  describe 'GET /show' do
    it 'returns http success' do
      get '/users/:user_id/posts/:id'
      expect(response).to have_http_status(:success)
    end

    it 'should render show' do
      get '/users/:user_id/posts/:id'
      expect(response).to render_template(:show)
    end
  end
end
