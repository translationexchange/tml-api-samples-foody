object @direction

attributes :id, :description, :index

node(:links) do |obj|
  {
      self: api_url_for(:controller => :direction, :action => :show, :id => obj.id),
      recipe: api_url_for(:controller => :recipe, :action => :show, :id => obj.recipe_id),
  }
end
