object @category

attributes :id, :key, :name, :locale, :featured_index

node(:link) do |obj|
  api_url_for(:controller => :category, :action => :show, :id => obj.id)
end
