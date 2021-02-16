class CreateVehiclemodels < ActiveRecord::Migration[6.0]
  def change
    create_table :vehiclemodels do |t|
      t.string :name
      t.belongs_to :vehiclebrand, null: false, foreign_key: true

      t.timestamps
    end
  end
end
