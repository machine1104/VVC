# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20190202165321) do

  create_table "announcements", force: :cascade do |t|
    t.integer "user_id"
    t.string "titolo"
    t.string "categoria"
    t.text "descrizione"
    t.string "posizione"
    t.string "email"
    t.string "telefono"
    t.decimal "prezzo", precision: 5, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "immagine_1"
    t.string "immagine_2"
    t.string "immagine_3"
    t.string "immagine_4"
    t.string "immagine_5"
    t.string "regione"
    t.index ["user_id", "created_at"], name: "index_announcements_on_user_id_and_created_at"
    t.index ["user_id"], name: "index_announcements_on_user_id"
  end

  create_table "answers", force: :cascade do |t|
    t.text "contenuto"
    t.integer "user_id"
    t.integer "announcement_id"
    t.integer "question_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["announcement_id"], name: "index_answers_on_announcement_id"
    t.index ["question_id"], name: "index_answers_on_question_id"
    t.index ["user_id"], name: "index_answers_on_user_id"
  end

  create_table "favorites", force: :cascade do |t|
    t.integer "user_id"
    t.integer "announcement_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["announcement_id"], name: "index_favorites_on_announcement_id"
    t.index ["user_id"], name: "index_favorites_on_user_id"
  end

  create_table "questions", force: :cascade do |t|
    t.text "contenuto"
    t.integer "user_id"
    t.integer "announcement_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["announcement_id"], name: "index_questions_on_announcement_id"
    t.index ["user_id"], name: "index_questions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username"
    t.string "comune"
    t.date "data_nascita"
    t.string "nome"
    t.string "cognome"
    t.string "telefono"
    t.string "indirizzo"
    t.boolean "admin"
    t.string "provider"
    t.string "provider_id"
    t.string "token"
    t.integer "expires_at"
    t.boolean "expires"
    t.string "refresh_token"
    t.string "remember_token"
    t.string "image"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
