class Vehiclemodel < ApplicationRecord
  belongs_to :vehiclebrand
  validates :name, presence: true
  validates_uniqueness_of :name
end
