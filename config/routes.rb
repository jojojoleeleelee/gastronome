Rails.application.routes.draw do

  root 'welcome#home'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  post 'logout', to: 'sessions#destroy'
  post '/users/new', to: 'users#create'

    delete 'ingredients/:id', to: 'ingredients#destroy'

  resources :recipes
  resources :ingredients, only: [:index, :show, :new, :create]
  resources :users, only: [:show, :new, :create, :destroy]


end
