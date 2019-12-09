class CreateReviewAmenities < ActiveRecord::Migration[6.0]
  def change
    create_table :review_amenities do |t|
      t.references :amenity ,  index: true, foreign_key: {on_delete: :cascade}
      t.references :review , index: true, foreign_key: {on_delete: :cascade}
      t.timestamps
    end
  end
end
