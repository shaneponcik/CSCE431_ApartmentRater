class Amenity < ApplicationRecord
  validates :name, presence: true, uniqueness: true

end
