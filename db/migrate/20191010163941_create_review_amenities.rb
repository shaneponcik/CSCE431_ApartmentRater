class CreateReviewAmenities < ActiveRecord::Migration[6.0]
  def change
    create_table :review_amenities do |t|
      t.references :amenity ,  index: true, foreign_key: true
      t.references :review , index: true, foreign_key: true
      t.timestamps
    end
  end
end
