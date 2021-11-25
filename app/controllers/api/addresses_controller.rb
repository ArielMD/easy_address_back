class Api::AddressesController < Api::ApiController
  before_action :set_address, only: %i[show update destroy]

  def index
    @addresses = Address.all
    render json: @addresses, status: :ok
  end

  def show
    render json: @address, status: :ok
  end

  def create
    @address = Address.new(address_params)
    if @address.save
      render json: @address, status: :created
    else
      render json: @address.errors, status: :unprocessable_entity
    end
  end

  def update
    if @address.update(address_params)
      render json: @address, status: :ok
    else
      render json: @address.errors, status: :unprocessable_entity
    end
  end

  def destroy
    if @address.destroy
      render json: {}, status: :ok
    else
      render json: @address.errors, status: :unprocessable_entity
    end
  end

  private

  def set_address
    @address = Address.find(params[:id])
  end

  def address_params
    params.require(:address).permit(:street, :external_number, :internal_number, :postal_code, :colonia,
                                    :municipality, :city, :state, :country)
  end
end
