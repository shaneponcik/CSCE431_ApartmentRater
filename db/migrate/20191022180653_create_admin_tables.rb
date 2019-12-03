class CreateAdminTables < ActiveRecord::Migration[6.0]
  def change
    create_table :admin_tables do |t|
      t.references :user, index: true, foreign_key: true, on_delete: :cascade
      t.timestamps
    end

    add_foreign_key :admin_tables, :users, on_delete: :cascade
  end
end
