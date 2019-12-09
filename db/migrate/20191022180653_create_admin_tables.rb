class CreateAdminTables < ActiveRecord::Migration[6.0]
  def change
    create_table :admin_tables do |t|
      t.references :user, index: true, foreign_key: {on_delete: :cascade}
      t.timestamps
    end

  end
end
