Rails.application.routes.draw do
  devise_for :users
  resources :approvers
  resources :owners
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "orders#index"
  resources :projects
  resources :orders
  resources :suppliers
  resources :owners
end
