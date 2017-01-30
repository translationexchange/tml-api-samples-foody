class AddTranslationsToRecipe < ActiveRecord::Migration
  def change
    Recipe.create_translation_table! :name => :string, :description => :text
  end
end
