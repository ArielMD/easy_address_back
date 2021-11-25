require_relative 'country_api'
require 'json'

class MexicoApi
  include CountryApi

  attr_reader :data

  def initialize
    set_data
  end

  def find_by_postal_code
    @data
  end

  def find_by_country
    @data
  end

  def find_states
    @data.keys
  end

  def find_cities(state)
    @data[state] || 'no se encuentra el ciudad'
  end

  def find_municipalities(state)
    @data[state] || 'no se encuentra el municipio'
  end

  def find_colonias
    'Emiliano Zapata'
  end

  private

  def set_data
    File.open('app/models/countries_request/states_of_mexico.json') do |f|
      @data = JSON.parse(f.read)
    end
  end
end
