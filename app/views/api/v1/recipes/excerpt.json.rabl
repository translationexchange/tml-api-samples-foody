object @recipe

attributes :id, :key, :category_id, :name, :locale, :description, :preparation, :featured_index

node(:image) do |obj|
  image_url_for(obj.image)
end

node(:link) do |obj|
  api_url_for(:controller => :recipes, :action => :show, :id => obj.id)
end
