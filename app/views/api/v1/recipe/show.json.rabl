object @recipe

attributes :id, :key, :name, :locale, :description, :preparation, :featured_index

node(:image) do |obj|
  image_url_for(obj.image)
end

node(:links) do |obj|
  {
      self: api_url_for(:controller => :recipe, :action => :show, :id => obj.id),
      directions: api_url_for(:controller => :recipe, :action => :directions, :id => obj.id),
      ingredients: api_url_for(:controller => :recipe, :action => :ingredients, :id => obj.id),
      category: api_url_for(:controller => :category, :action => :show, :id => obj.category_id),
  }
end
