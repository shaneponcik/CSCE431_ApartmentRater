class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :email, unique: true
      t.boolean :verified
      t.string :password
      t.timestamps
    end
    add_index :users, :email, unique: true
  end
end
