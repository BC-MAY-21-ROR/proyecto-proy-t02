Rails.application.routes.draw do
  devise_for :users
  resources :offers
  resources :products
  resources :companies
  resources :categories
  resources :states
  resources :townships
  resources :towns
  resources :administrators
  root 'customers#index'
end
