class CreateInundationDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :inundation_details do |t|
      t.string :planned_rainfall
      t.integer :notification_number
      t.string :related_municipalities
      t.date :designated_date
      t.string :target_flood_forecast_river
      t.integer :creation_type_code
      t.string :creator

      t.timestamps
    end
  end
end
