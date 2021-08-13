Rails.application.routes.draw do
  root "companies#index"
  devise_for :users

  resource :companies
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
