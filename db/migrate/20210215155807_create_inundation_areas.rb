class CreateInundationAreas < ActiveRecord::Migration[6.1]
  def change
    create_table :inundation_areas do |t|
      t.references :prefecture, foreign_key: true
      t.references :inundation_depth, foreign_key: true
      t.st_polygon :geom, srid: 3785

      t.timestamps
    end
  end
end
