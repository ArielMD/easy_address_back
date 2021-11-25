require 'rails_helper'

RSpec.describe Api::SearchesController, type: :routing do
  describe 'routing' do
    it 'routes to #postal_code' do
      expect(get: '/api/search/postal_code').to route_to('api/searches#postal_code')
    end

    it 'routes to #country' do
      expect(get: '/api/search/country').to route_to('api/searches#country')
    end

    it 'routes to #state' do
      expect(get: '/api/search/states').to route_to('api/searches#state')
    end

    it 'routes to #city' do
      expect(get: '/api/search/cities?state=merida').to route_to('api/searches#city', state: 'merida')
    end

    it 'routes to #municipality' do
      expect(get: '/api/search/municipalities?state=merida').to route_to('api/searches#municipality', state: 'merida')
    end

    it 'routes to #colonias' do
      expect(get: '/api/search/colonias').to route_to('api/searches#colonia')
    end
  end
end
