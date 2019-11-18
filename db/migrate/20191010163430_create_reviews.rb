class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.references :apartment, index:true, foreign_key:true
      t.references :user, index:true, foreign_key:true
      t.text :review_text
      t.timestamps
    end
  end
end
