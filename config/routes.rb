Rails.application.routes.draw do
  api_version(
      :module => 'Api::V1',
      :path => {:value => 'api/v1'},
      :defaults => {format: :json}
  ) do
    resources :categories, only: [:index, :show, :create, :update, :destroy] do
      member do
        get :recipes
      end
    end

    resources :recipes, only: [:index, :show, :create, :update, :destroy] do
      member do
        get :directions
        get :ingredients
      end
    end

    resources :directions, only: [:show, :create, :update, :destroy]
    resources :ingredients, only: [:show, :create, :update, :destroy]
  end

end
