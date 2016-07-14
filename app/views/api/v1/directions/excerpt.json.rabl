object @direction

attributes :id, :recipe_id, :description, :index

node(:link) do |obj|
  api_url_for(:controller => :directions, :action => :show, :id => obj.id)
end
