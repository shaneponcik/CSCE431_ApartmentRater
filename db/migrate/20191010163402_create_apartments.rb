class CreateApartments < ActiveRecord::Migration[6.0]
  def change
    create_table :apartments do |t|
      t.string :name
      t.timestamps
    end
    add_index :apartments, :name, unique: true
  end
end
