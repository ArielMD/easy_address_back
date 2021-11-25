require_relative 'argentina_api'
require_relative 'mexico_api'
require_relative 'brazil_api'

class ApplicationRequest
  attr_reader :repository

  def initialize(country)
    if country == 'argentina'
      @repository = ArgentinaApi.new
    elsif country == 'brazil'
      @repository = BrazilApi.new
    elsif country == 'mexico'
      @repository = MexicoApi.new
    else
      raise 'Not implemented'
    end
  end
end
