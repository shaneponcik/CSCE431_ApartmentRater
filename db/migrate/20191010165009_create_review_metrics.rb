class CreateReviewMetrics < ActiveRecord::Migration[6.0]
  def change
    create_table :review_metrics do |t|
      t.references :review, index:true, foreign_key:true
      t.references :metric, index:true, foreign_key: true
      t.integer :rating
      t.timestamps
    end
  end
end
