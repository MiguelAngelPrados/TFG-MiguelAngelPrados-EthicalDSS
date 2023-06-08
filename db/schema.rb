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

ActiveRecord::Schema[7.0].define(version: 2023_04_04_062349) do
  create_table "diagnoses", force: :cascade do |t|
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "diagnoses_patients", id: false, force: :cascade do |t|
    t.integer "diagnosis_id", null: false
    t.integer "patient_id", null: false
  end

  create_table "interventions", force: :cascade do |t|
    t.integer "patient_id", null: false
    t.integer "medical_team_id", null: false
    t.text "procedure"
    t.boolean "patient_judgement"
    t.boolean "family_criteria"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["medical_team_id"], name: "index_interventions_on_medical_team_id"
    t.index ["patient_id"], name: "index_interventions_on_patient_id"
  end

  create_table "medical_teams", force: :cascade do |t|
    t.string "specialization"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "patients", force: :cascade do |t|
    t.string "name"
    t.integer "age"
    t.string "gender"
    t.text "admission_reason"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "password_digest"
    t.boolean "admin"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "interventions", "medical_teams"
  add_foreign_key "interventions", "patients"
end
