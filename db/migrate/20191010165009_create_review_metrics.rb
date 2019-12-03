class CreateReviewMetrics < ActiveRecord::Migration[6.0]
  def change
    create_table :review_metrics do |t|
      t.references :review, index:true, foreign_key:true
      t.references :metric, index:true, foreign_key: true
      t.integer :rating
      t.timestamps
    end

    add_foreign_key :review_metrics, :reviews, on_delete: :cascade
    add_foreign_key :review_metrics, :metrics, on_delete: :cascade
  end
end
