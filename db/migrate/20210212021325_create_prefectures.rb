class CreatePrefectures < ActiveRecord::Migration[6.1]
  def change
    create_table :prefectures do |t|
      t.string :name_en, null: false
      t.string :name_ja, null: false

      t.timestamps
    end
  end
end
