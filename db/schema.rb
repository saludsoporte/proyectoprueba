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

ActiveRecord::Schema[7.2].define(version: 2024_10_08_173501) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "autors", force: :cascade do |t|
    t.string "nombre"
    t.string "telefono"
    t.string "titulo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "pais"
  end

  create_table "bibliotecas", force: :cascade do |t|
    t.string "nombre"
    t.string "estado"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "libros", force: :cascade do |t|
    t.string "nombre"
    t.string "editorial"
    t.date "fechaPub"
    t.bigint "autor_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "condicion", default: "nuevo"
    t.index ["autor_id"], name: "index_libros_on_autor_id"
  end

  create_table "relacion_bibliotecas", force: :cascade do |t|
    t.bigint "biblioteca_id", null: false
    t.bigint "libro_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["biblioteca_id"], name: "index_relacion_bibliotecas_on_biblioteca_id"
    t.index ["libro_id"], name: "index_relacion_bibliotecas_on_libro_id"
  end

  add_foreign_key "libros", "autors"
  add_foreign_key "relacion_bibliotecas", "bibliotecas"
  add_foreign_key "relacion_bibliotecas", "libros"
end
