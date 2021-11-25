require 'rails_helper'

RSpec.describe 'api/addresses', type: :request do
  let(:valid_attributes) do
    {
      "id": 1,
      "street": 'calle 129',
      "external_number": 1,
      "internal_number": 1,
      "postal_code": 92_946,
      "colonia": 'Emiliano Zapata',
      "municipality": 'Merida',
      "city": 'Merida',
      "state": 'Yucatan',
      "country": 'Mexico'
    }
  end

  let(:invalid_attributes) do
    {
      "street": '',
      "external_number": '',
      "internal_number": '',
      "postal_code": '',
      "colonia": '',
      "municipality": '',
      "city": '',
      "state": '',
      "country": ''
    }
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      get '/api/addresses'
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      address = Address.create(valid_attributes)
      get "/api/addresses/#{address.id}"
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Address' do
        expect do
          post '/api/addresses', params: { address: valid_attributes }
        end.to change(Address, :count).by(1)
        expect(response).to have_http_status(:created)
      end
    end
    context 'with invalid parameters' do
      it 'does not create a new Address' do
        expect do
          post '/api/addresses', params: { address: invalid_attributes }
        end.to change(Address, :count).by(0)
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) do
        {
          "street": 'calle 100',
          "external_number": 2,
          "internal_number": 3,
          "postal_code": 92_946,
          "colonia": 'Emiliano Zapata 4',
          "municipality": 'Merida',
          "city": 'Merida',
          "state": 'Yucatan',
          "country": 'Mexico'
        }
      end

      it 'updates the requested address' do
        address = Address.create(valid_attributes)

        patch "/api/addresses/#{address.id}", params: { address: new_attributes }
        expect(response).to have_http_status(:ok)
      end
    end

    context 'with invalid parameters' do
      it 'renders a successful response' do
        address = Address.create(valid_attributes)
        patch "/api/addresses/#{address.id}", params: { address: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested address' do
      address = Address.create(valid_attributes)
      expect do
        delete "/api/addresses/#{address.id}"
      end.to change(Address, :count).by(-1)
      expect(response).to have_http_status(:ok)
    end
  end
end
