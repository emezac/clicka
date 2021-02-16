# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

# create comments in DB. Comments belong to tickets
(1..10).each do |id|
  Vehiclebrand.create!(
    id: id,
    name: Faker::Ancient.unique.god
  )
end

(1..10).each do |id|
  Vehiclemodel.create!(
    id: id,
    name: Faker::Artist.unique.name,
    vehiclebrand_id: Vehiclebrand.find(rand(1..10)).id
  )
end

(1..10).each do |id|
    Vehicle.create!(
        id: id,
        year: Faker::Number.number(digits: 4),
        mileage: Faker::Number.number(digits: 5),
        price: rand(110000.20...760000.95),
        vehiclemodel_id: Vehiclemodel.find(rand(1..10)).id
    )
end
