Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'
  scope module: 'operations' do
    resource :operations, only: [] do
      get 'upcoming', to: :upcoming
    end

    resources :operations do
      resources :addons
      resources :groups do
        resources :slots
      end
      resources :play_with_six
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
