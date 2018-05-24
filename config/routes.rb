Rails.application.routes.draw do
  root 'welcome#home'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  post 'logout', to: 'sessions#destroy'

  get 'recipes/new', to: 'recipes#new'
  post 'recipes/new', to: 'recipes#scrape'
  post 'recipes/scrape', to: 'recipes#create', as: '/showtime'

  get 'recipes/create', to: 'recipes#create', as: '/create'

  get 'auth/google_oauth2/callback', to: 'sessions#create'

  resources :recipes, only: [:index, :show, :edit, :update, :destroy]
  resources :ingredients, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  resources :users, only: [:show, :new, :create, :edit, :update, :destroy]
end
