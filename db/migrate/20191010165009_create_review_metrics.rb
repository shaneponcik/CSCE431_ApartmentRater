class CreateReviewMetrics < ActiveRecord::Migration[6.0]
  def change
    create_table :review_metrics do |t|
      t.references :review, index:true, foreign_key:{on_delete: :cascade}
      t.references :metric, index:true, foreign_key: {on_delete: :cascade}
      t.integer :rating
      t.timestamps
    end
  end
end
