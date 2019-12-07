class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.references :apartment, index:true, foreign_key: {on_delete: :cascade}
      t.references :user, index:true, foreign_key: {on_delete: :cascade}
      t.text :review_text
      t.decimal :price, :default => 0.00
      t.timestamps
    end
  end
end
