object @category

attributes :id, :key, :name, :locale, :featured_index

node(:links) do |obj|
  {
      self: api_url_for(:controller => :categories, :action => :show, :id => obj.id),
      recipes: api_url_for(:controller => :categories, :action => :recipes, :id => obj.id)
  }
end
