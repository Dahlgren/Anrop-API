Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'
  scope module: 'operations' do

    resources :operations do
      get :hidden, on: :collection
      get :upcoming, on: :collection

      resources :aar
      resources :addons
      resources :groups do
        post 'clone', controller: 'clone_group'
        resources :slots
      end
      resources :play_with_six
      resources :steam_workshop
    end
  end

  resources :sessions, only: [:index, :create]
  resources :shouts

  namespace :users do
    resources :search, only: :index
  end
  resources :users, only: [:index, :show] do
    scope module: :users do
      resources :shouts, only: :index
    end
  end
end
