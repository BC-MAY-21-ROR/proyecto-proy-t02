Rails.application.routes.draw do
  root 'customers#index'
  
  devise_for :users
  resources :offers
  resources :products
  resources :companies
  resources :categories
  resources :states
  resources :townships
  resources :towns
  resources :administrators do    
    get 'company/:company_id', to: 'administrators#product_company', on: :collection, as: :product_companies    
  end

  get 'bussiness', to: 'administrators#bussiness'
  get 'inventory', to: 'administrators#inventory'
  get 'product/results', to: 'customers#product_results', as: 'product_results' 
  get 'product/seemore', to: 'customers#show', as: 'show'
end
