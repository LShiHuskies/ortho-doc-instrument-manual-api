Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api do
    resources :users, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  end

  get 'login', to: 'api/sessions#new'
  post 'login', to: 'api/sessions#create'
  delete 'logout', to: 'api/sessions#destroy'
end
