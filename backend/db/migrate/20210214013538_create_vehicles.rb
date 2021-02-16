class CreateVehicles < ActiveRecord::Migration[6.0]
  def change
    create_table :vehicles do |t|
      t.integer :year, limit: 4
      t.integer :mileage
      t.decimal :price, precision: 10, scale: 2
      t.references :vehiclemodel, null: false, foreign_key: true

      t.timestamps
    end
  end
end
