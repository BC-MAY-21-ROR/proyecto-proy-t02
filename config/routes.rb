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
  get 'product/results', to: 'customers#product_results', as: 'product_results' 
  get 'product/seemore', to: 'customers#show', as: 'show'
  
  root 'customers#index'
end
