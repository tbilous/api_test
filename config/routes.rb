Rails.application.routes.draw do

  concern :role_grantable do
    member do
      post 'grant_role'
      delete 'remove_role'
    end
  end

  concern :permit_grantable do
    member do
      post 'grant_permission'
      delete 'remove_permission'
    end
  end
  scope module: 'api', defaults: { format: :json } do
    namespace :v1 do
      resources :users, concerns: %i(role_grantable permit_grantable), only: %w(create show index destroy)
      get '/search', to: 'users#search'
      resources :permissions, only: %w(index destroy)
      resources :roles, concerns: [:permit_grantable], only: %w(create index destroy)
      resources :write_resource_permissions, only: %w(create)
      resources :read_resource_permissions, only: %w(create)
      resources :action_permissions, only: %w(create)
    end
  end
end
