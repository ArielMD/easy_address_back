require_relative '../../models/countries_request/application_request'

class Api::SearchesController < Api::ApiController
  before_action :set_repository, only: %i[postal_code country state city colonia municipality]

  def postal_code
    data = @repository.find_by_postal_code
    render json: data, status: :ok
  end

  def country
    data = @repository.find_by_country
    render json: data, status: :ok
  end

  def state
    states = @repository.find_states
    render json: states, status: :ok
  end

  def city
    if params[:state]
      cities = @repository.find_cities(params[:state])
      render json: cities, status: :ok
    else
      render json: { eror: 'El parametro state es obligatorio' }, status:	:bad_request
    end
  end

  def municipality
    if params[:state]
      municipalities = @repository.find_municipalities(params[:state])
      render json: municipalities, status: :ok
    else
      render json: { eror: 'El parametro state es obligatorio' }, status:	:bad_request
    end
  end

  def colonia
    colonias = @repository.find_colonias
    render json: colonias, status: :ok
  end

  private

  def set_repository
    app = ApplicationRequest.new('mexico')
    @repository = app.repository
  end
end
