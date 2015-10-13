# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20150928043339) do

  create_table "categories", force: :cascade do |t|
    t.string   "key"
    t.string   "name"
    t.string   "locale"
    t.integer  "featured_index"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "categories", ["key"], name: "index_categories_on_key"

  create_table "directions", force: :cascade do |t|
    t.integer  "recipe_id"
    t.text     "description"
    t.integer  "index"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "directions", ["recipe_id"], name: "index_directions_on_recipe_id"

  create_table "ingredients", force: :cascade do |t|
    t.integer  "recipe_id"
    t.string   "quantity"
    t.string   "name"
    t.string   "measurements"
    t.integer  "index"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "ingredients", ["recipe_id"], name: "index_ingredients_on_recipe_id"

  create_table "recipes", force: :cascade do |t|
    t.integer  "category_id"
    t.string   "key"
    t.string   "name"
    t.string   "locale"
    t.text     "description"
    t.string   "image"
    t.text     "preparation"
    t.integer  "featured_index"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "recipes", ["category_id"], name: "index_recipes_on_category_id"
  add_index "recipes", ["key"], name: "index_recipes_on_key"

end
