Rails.application.routes.draw do


  root  'recipe#index'
  get   'recipe/create'       => 'recipe#create'
  post  'recipe/create'       => 'recipe#create'

  get   'recipe/:id/update'   => 'recipe#create'
  post  'recipe/:id/update'   => 'recipe#create'
  get   'recipe/:id/delete'   => 'recipe#delete'

  get   'recipe/:key'         => 'recipe#show'
  get   'category/:key'       => 'category#show'


  get   'test'                => 'test#index'


  api_version(
    :module     => 'Api::V1',
    :parameter  => {:name   => 'version', :value => '1'},
    :path       => {:value  => 'api/v1'},
    :header     => {:name   => 'Accept', :value => 'application/foody; version=1'}
  ) do
    match '/categories'               => 'category#index',      :via => :get,     defaults: {format: :json}
    match '/categories/:id'           => 'category#show',       :via => :get,     defaults: {format: :json}
    match '/categories/:id'           => 'category#create',     :via => :post,    defaults: {format: :json}
    match '/categories/:id'           => 'category#update',     :via => :put,     defaults: {format: :json}
    match '/categories/:id'           => 'category#delete',     :via => :delete,  defaults: {format: :json}
    match '/categories/:id/recipes'   => 'category#recipes',    :via => :get,     defaults: {format: :json}

    match '/recipes'                  => 'recipe#index',        :via => :get,     defaults: {format: :json}
    match '/recipes/:id'              => 'recipe#show',         :via => :get,     defaults: {format: :json}
    match '/recipes/:id'              => 'recipe#create',       :via => :post,    defaults: {format: :json}
    match '/recipes/:id'              => 'recipe#update',       :via => :put,     defaults: {format: :json}
    match '/recipes/:id'              => 'recipe#delete',       :via => :delete,  defaults: {format: :json}
    match '/recipes/:id/directions'   => 'recipe#directions',   :via => :get,     defaults: {format: :json}
    match '/recipes/:id/ingredients'  => 'recipe#ingredients',  :via => :get,     defaults: {format: :json}

    match '/directions/:id'           => 'direction#show',      :via => :get,     defaults: {format: :json}
    match '/directions/:id'           => 'direction#create',    :via => :post,    defaults: {format: :json}
    match '/directions/:id'           => 'direction#update',    :via => :put,     defaults: {format: :json}
    match '/directions/:id'           => 'direction#delete',    :via => :delete,  defaults: {format: :json}

    match '/ingredients/:id'          => 'ingredient#show',     :via => :get,     defaults: {format: :json}
    match '/ingredients/:id'          => 'ingredient#create',   :via => :post,    defaults: {format: :json}
    match '/ingredients/:id'          => 'ingredient#update',   :via => :put,     defaults: {format: :json}
    match '/ingredients/:id'          => 'ingredient#delete',   :via => :delete,  defaults: {format: :json}
  end

end
