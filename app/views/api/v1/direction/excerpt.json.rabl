object @direction

attributes :id, :description, :index

node(:link) do |obj|
  api_url_for(:controller => :direction, :action => :show, :id => obj.id)
end
