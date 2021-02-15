class CreateInundationDepths < ActiveRecord::Migration[6.1]
  def change
    create_table :inundation_depths do |t|
      t.decimal :min, precision: 2, scale: 1, null: false
      t.decimal :max, precision: 2, scale: 1

      t.timestamps
    end
  end
end
