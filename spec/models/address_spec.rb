require 'rails_helper'

RSpec.describe Address, type: :model do
  before(:each) do
    @address = Address.new(valid_attributes)
  end

  let(:valid_attributes) do
    {
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

  it 'is valid with valid attributes' do
    puts @address
    expect(@address).to be_valid
  end

  describe 'Validations' do
    it { should validate_presence_of(:street) }
    it { should validate_presence_of(:external_number) }
    it { should validate_presence_of(:internal_number) }
    it { should validate_presence_of(:postal_code) }
    it { should validate_presence_of(:municipality) }
    it { should validate_presence_of(:city) }
    it { should validate_presence_of(:state) }
    it { should validate_presence_of(:country) }
  end
end
