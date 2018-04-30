Rails.application.routes.draw do

  concern :permitable do
    member do
      post 'grant_permission'
      post 'grant_role'
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
      resources :users, concerns: %i(permitable permit_grantable), only: %w(create show index)
      get '/search', to: 'users#search'
      resources :permissions, only: %w(index)
      resources :roles, concerns: [:permit_grantable], only: %w(create index)
      resources :write_resource_permissions, only: %w(create)
      resources :read_resource_permissions, only: %w(create)
      resources :action_permissions, only: %w(create)
    end
  end
end
