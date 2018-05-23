Rails.application.routes.draw do
  devise_for :users
  root 'welcome#home'
  resources :pantries
  resources :recipes
  resources :ingredients
  resources :users

end
