object @ingredient

attributes :id, :quantity, :name, :measurements, :index

node(:link) do |obj|
  api_url_for(:controller => :ingredient, :action => :show, :id => obj.id)
end

