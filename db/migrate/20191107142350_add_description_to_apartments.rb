class AddDescriptionToApartments < ActiveRecord::Migration[6.0]
  def change
    add_column :apartments, :description, :string
  end
end
