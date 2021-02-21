# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_02_26_024407) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "postgis"

  create_table "inundation_areas", force: :cascade do |t|
    t.bigint "prefecture_id"
    t.bigint "inundation_depth_id"
    t.geometry "geom", limit: {:srid=>3785, :type=>"st_polygon"}
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["inundation_depth_id"], name: "index_inundation_areas_on_inundation_depth_id"
    t.index ["prefecture_id"], name: "index_inundation_areas_on_prefecture_id"
  end

  create_table "inundation_depths", force: :cascade do |t|
    t.decimal "min", precision: 2, scale: 1, null: false
    t.decimal "max", precision: 2, scale: 1
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "inundation_details", force: :cascade do |t|
    t.string "planned_rainfall"
    t.integer "notification_number"
    t.string "related_municipalities"
    t.date "designated_date"
    t.string "target_flood_forecast_river"
    t.integer "creation_type_code"
    t.string "creator"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "prefectures", force: :cascade do |t|
    t.string "name_en", null: false
    t.string "name_ja", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "inundation_areas", "inundation_depths"
  add_foreign_key "inundation_areas", "prefectures"
end
