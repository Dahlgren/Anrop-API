Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'
  resources :operations
  resources :shouts
  resources :users, only: [:index, :show] do
    scope module: :users do
      resources :shouts, only: :index
    end
  end
end
