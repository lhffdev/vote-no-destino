# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_12_08_194019) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "destinos", force: :cascade do |t|
    t.string "nome", null: false
    t.string "descricao", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["nome"], name: "index_destinos_on_nome", unique: true
  end

  create_table "participantes", force: :cascade do |t|
    t.string "nome", null: false
    t.string "email", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_participantes_on_email", unique: true
    t.index ["nome"], name: "index_participantes_on_nome", unique: true
  end

  create_table "voto_detalhes", force: :cascade do |t|
    t.bigint "voto_id", null: false
    t.bigint "destino_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["destino_id"], name: "index_voto_detalhes_on_destino_id"
    t.index ["voto_id", "destino_id"], name: "index_voto_detalhes_on_voto_id_and_destino_id", unique: true
    t.index ["voto_id"], name: "index_voto_detalhes_on_voto_id"
  end

  create_table "votos", force: :cascade do |t|
    t.bigint "participante_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["participante_id"], name: "index_votos_on_participante_id"
  end

  add_foreign_key "voto_detalhes", "destinos"
  add_foreign_key "voto_detalhes", "votos"
  add_foreign_key "votos", "participantes"
end
