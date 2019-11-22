class AddDetailsToApartments < ActiveRecord::Migration[6.0]
  def change
    add_column :apartments, :bus_route, :decimal
    add_column :apartments, :near_campus, :boolean
    add_column :apartments, :building_near, :string
  end
end
