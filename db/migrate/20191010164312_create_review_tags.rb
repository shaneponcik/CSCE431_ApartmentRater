class CreateReviewTags < ActiveRecord::Migration[6.0]
  def change
    create_table :review_tags do |t|
      t.references :review, index: true, foreign_key: {on_delete: :cascade}
      t.references :tag, index:true, foreign_key: {on_delete: :cascade}
      t.timestamps
    end
  end
end
