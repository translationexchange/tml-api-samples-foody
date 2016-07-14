object @recipe

attributes :id, :key, :name, :category_id, :locale, :description, :preparation, :featured_index

node(:image) do |obj|
  image_url_for(obj.image)
end

node(:links) do |obj|
  {
      self: api_url_for(:controller => :recipes, :action => :show, :id => obj.id),
      directions: api_url_for(:controller => :recipes, :action => :directions, :id => obj.id),
      ingredients: api_url_for(:controller => :recipes, :action => :ingredients, :id => obj.id),
      category: api_url_for(:controller => :categories, :action => :show, :id => obj.category_id),
  }
end
