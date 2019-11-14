class AddImageUrlToApartments < ActiveRecord::Migration[6.0]
  def change
    add_column :apartments, :imageURL, :string
  end
end
