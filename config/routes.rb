Rails.application.routes.draw do

  concern :permitable do
    member do
      post 'grant_permission'
      post 'grant_role'
    end
  end

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :users, concerns: [:permitable], only: %w(create) do
        get :show, on: :collection
      end
      resources :permissions, only: %w(index)
      resources :roles, only: %w(index)
      get '/me', to: 'users#me'
    end
  end
end
