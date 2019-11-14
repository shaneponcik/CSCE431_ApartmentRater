class AddWebsiteToApartments < ActiveRecord::Migration[6.0]
  def change
    add_column :apartments, :website, :string
  end
end
