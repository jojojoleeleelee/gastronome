Rails.application.routes.draw do
  root 'welcome#home'
  resources :pantries
  resources :recipes
  resources :ingredients
  resources :users

end
