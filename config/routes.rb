Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    resources :watches, only: :index do
      collection do
        get :favorites, to: 'favorites#index'
      end

      post :favorite, to: 'favorites#create'
    end

    namespace :users do
      resources :users, only: %w[create], path: '' do
        collection do
          post :login, to: "sessions#create"
          delete :logout, to: "sessions#destroy"
          get :me
        end
      end
    end
  end
end
