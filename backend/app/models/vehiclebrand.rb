class Vehiclebrand < ApplicationRecord
  validates :name, presence: true
  validates_uniqueness_of :name
end
