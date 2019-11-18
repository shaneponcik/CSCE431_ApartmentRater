class Metric < ApplicationRecord
  validates :name, presence: true, uniqueness: false


end
