Rails.application.routes.draw do

  get "/:locale" => 'recipes#index'

  scope "(:locale)" do
    root 'recipes#index'

    resources :recipes do
      member do
        get :delete
      end
    end

    resources :i18n, only: [:index]

    resources :categories, only: [:show]

    resources :test, only: [] do
      collection do
        get :index
        get :emails
        get :plurals
      end
    end
  end

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
