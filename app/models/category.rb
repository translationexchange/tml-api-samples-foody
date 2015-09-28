class Category < ActiveRecord::Base
  has_many :recipes

  def featured_recipes
    recipes.where('featured_index not null').order('featured_index asc')
  end

end
