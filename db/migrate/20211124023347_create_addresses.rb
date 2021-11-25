class CreateAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :addresses do |t|
      t.string :street
      t.string :external_number
      t.string :internal_number
      t.integer :postal_code
      t.string :colonia
      t.string :municipality
      t.string :city
      t.string :state
      t.string :country
      t.timestamps
    end
  end
end
