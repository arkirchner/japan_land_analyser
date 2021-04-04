class CreateInundationAreas < ActiveRecord::Migration[6.1]
  def change
    create_table :inundation_areas do |t|
      t.references :prefecture, foreign_key: true, null: true
      t.references :inundation_depth, foreign_key: true, null: false
      t.references :inundation_detail, foreign_key: true, null: true
      t.st_polygon :geom, srid: 3785, null: false

      t.timestamps
    end
  end
end
