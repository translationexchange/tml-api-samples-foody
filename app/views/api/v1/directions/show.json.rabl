object @direction

attributes :id, :recipe_id, :description, :index

node(:links) do |obj|
  {
      self: api_url_for(:controller => :directions, :action => :show, :id => obj.id),
      recipe: api_url_for(:controller => :recipes, :action => :show, :id => obj.recipe_id),
  }
end
