object @ingredient

attributes :id, :recipe_id, :quantity, :name, :measurements, :index

node(:links) do |obj|
  {
      self: api_url_for(:controller => :ingredients, :action => :show, :id => obj.id),
      recipe: api_url_for(:controller => :recipes, :action => :show, :id => obj.recipe_id),
  }
end
