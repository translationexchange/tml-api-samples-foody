object @recipe

attributes :id, :key, :name, :locale, :description, :preparation, :featured_index

node(:image) do |obj|
  obj.image
end

node(:link) do |obj|
  api_url_for(:controller => :recipe, :action => :show, :id => obj.id)
end
