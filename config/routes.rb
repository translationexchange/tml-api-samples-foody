Rails.application.routes.draw do


  root  'recipe#index'
  get   'recipe/create'       => 'recipe#create'
  post  'recipe/create'       => 'recipe#create'

  get   'recipe/:id/update'   => 'recipe#create'
  post  'recipe/:id/update'   => 'recipe#create'
  get   'recipe/:id/delete'   => 'recipe#delete'

  get   'recipe/:key'         => 'recipe#show'

  get   'category/:key'       => 'category#show'

end
