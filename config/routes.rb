Rails.application.routes.draw do

  root 'welcome#home'

  get '/auth/google/callback' => 'sessions#create'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  post 'logout', to: 'sessions#destroy'
  post '/users/new', to: 'users#create'

  delete 'ingredients/:id', to: 'ingredients#destroy'

  get 'recipes/new', to: 'recipes#new'
  post 'recipes/new', to: 'recipes#scrape'
  post 'recipes/scrape', to: 'recipes#create', as: '/showtime'
  get 'recipes/index', to: 'recipes#index', as: '/all_recipes'
  get 'recipes/mine', to: 'recipes#mine', as: '/my_recipes'
  resources :recipes, only: [:show, :edit, :update, :destroy]
  post 'users/:user_id/ingredients', to: 'ingredients#create'

  resources :ingredients

  resources :users do
    resources :ingredients, only: [:new, :index, :show, :edit, :update]
  end

end
