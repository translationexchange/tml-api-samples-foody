class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.integer :category_id
      t.string  :key
      t.string  :name
      t.string  :locale
      t.text    :description
      t.string  :image
      t.text    :preparation
      t.integer :featured_index

      t.timestamps null: false
    end

    add_index :recipes, :category_id
    add_index :recipes, :key
  end
end
