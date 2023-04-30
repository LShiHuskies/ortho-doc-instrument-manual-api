Rails.application.routes.draw do
  
  

  # action cable server
  mount ActionCable.server => "/cable"

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

  resources :messages

  get 'login', to: 'api/sessions#new'
  post 'login', to: 'api/sessions#create'
  delete 'logout', to: 'api/sessions#destroy'
end
