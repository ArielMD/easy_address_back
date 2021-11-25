require 'rails_helper'
# require 'app/models/countries_request/application_request'

RSpec.describe 'api/searches', type: :request do
  describe 'GET /postal_code' do
    it 'render a successful response' do
      get '/api/search/postal_code'
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET /country' do
    it 'render a successful response' do
      get '/api/search/country'
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET /state' do
    it 'render a successful response' do
      get '/api/search/states'
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET /cities' do
    it 'render a successful response' do
      get '/api/search/cities?state=Merida'
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET /municipalities' do
    it 'render a successful response' do
      get '/api/search/municipalities?state=Merida'
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET /colonias' do
    it 'render a successful response' do
      get '/api/search/colonias'
      expect(response).to have_http_status(:ok)
    end
  end
end
