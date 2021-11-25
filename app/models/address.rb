class Address < ApplicationRecord
  validates_presence_of :street, :external_number, :internal_number, :postal_code, :colonia, :municipality, :city,
                        :state, :country
end
