require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      get '/user/index'
      expect(response).to have_http_status(:success)
    end

    it 'should render index' do
      get '/'
      expect(response).to render_template(:index)
    end
  end
end

describe 'GET /show' do
  it 'returns http success' do
    get '/users/:id'
    expect(response).to have_http_status(:success)
  end

  it 'should render show' do
    get '/users/:id'
    expect(response).to render_template(:show)
  end
end
