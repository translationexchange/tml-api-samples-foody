Rails.application.routes.draw do


  root  'recipe#index'
  get   'recipe/create'   => 'recipe#create'
  post  'recipe/create'   => 'recipe#create'
  get   'recipe/:key'     => 'recipe#show'

  get   'category/:key'   => 'category#show'

end
