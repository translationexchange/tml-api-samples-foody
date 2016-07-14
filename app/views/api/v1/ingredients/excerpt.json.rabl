object @ingredient

attributes :id, :recipe_id, :quantity, :name, :measurements, :index

node(:link) do |obj|
  api_url_for(:controller => :ingredients, :action => :show, :id => obj.id)
end

