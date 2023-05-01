Rails.application.routes.draw do
  
  # host = Rails.env == 'development' ? "localhost:3000" : "action-game-app-api.herokuapp.com"
  # default_url_options :host => host

  # action cable server

  # resources :conversations do
  #   resources :messages
  # end

  namespace :api do
    resources :users, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
      resources :conversations do
        resources :messages
      end
      resources :messages
    end
    resources :conversations do
      resources :messages
    end
    resources :messages
  end

  # resources :messages

  get 'login', to: 'api/sessions#new'
  post 'login', to: 'api/sessions#create'
  delete 'logout', to: 'api/sessions#destroy'

  mount ActionCable.server => '/cable'
end
