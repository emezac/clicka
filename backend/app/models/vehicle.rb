class Vehicle < ApplicationRecord
  belongs_to :vehiclemodel
  has_one :vehiclebrand, through: :vehiclemodel
   scope :find_by_model_name, -> (model_name) { where('vehicles.vehiclemodel_id = ?', model_name) }
   scope :find_by_brand_name, -> (brand_name) { joins(:vehiclemodel).where('vehiclemodels.vehiclebrand_id = (?)', brand_name) }
   scope :find_by_year, -> (year) { includes(:vehiclemodel).where('vehicles.year >= ?', year) }
   scope :find_by_mileage, -> (mileage) { includes(:vehiclemodel).where('vehicles.mileage <= ?', mileage) }
   scope :find_by_price, -> (price) { includes(:vehiclemodel).where('vehicles.price <= ?', price) }
end
