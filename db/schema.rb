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

ActiveRecord::Schema[7.0].define(version: 2023_01_24_143843) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "detalles_ordenes", force: :cascade do |t|
    t.integer "cantidad"
    t.decimal "precio"
    t.bigint "producto_id", null: false
    t.bigint "orden_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["orden_id"], name: "index_detalles_ordenes_on_orden_id"
    t.index ["producto_id"], name: "index_detalles_ordenes_on_producto_id"
  end

  create_table "metodos_pago", force: :cascade do |t|
    t.string "nombre"
    t.string "codigo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ordenes", force: :cascade do |t|
    t.bigint "usuario_id", null: false
    t.string "numero"
    t.decimal "total"
    t.string "estado"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["usuario_id"], name: "index_ordenes_on_usuario_id"
  end

  create_table "pagos", force: :cascade do |t|
    t.string "estado"
    t.decimal "total"
    t.string "token"
    t.bigint "orden_id", null: false
    t.bigint "metodo_pago_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["metodo_pago_id"], name: "index_pagos_on_metodo_pago_id"
    t.index ["orden_id"], name: "index_pagos_on_orden_id"
  end

  create_table "productos", force: :cascade do |t|
    t.string "nombre"
    t.text "descripcion"
    t.integer "stock"
    t.decimal "precio"
    t.string "sku"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "usuarios", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_usuarios_on_email", unique: true
    t.index ["reset_password_token"], name: "index_usuarios_on_reset_password_token", unique: true
  end

  add_foreign_key "detalles_ordenes", "ordenes"
  add_foreign_key "detalles_ordenes", "productos"
  add_foreign_key "ordenes", "usuarios"
  add_foreign_key "pagos", "metodos_pago"
  add_foreign_key "pagos", "ordenes"
end
