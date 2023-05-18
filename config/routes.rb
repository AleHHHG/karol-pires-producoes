Rails.application.routes.draw do
  devise_for :users, skip: %i[registrations]
  as :user do
    get 'users/edit' => 'devise/registrations#edit', :as => 'edit_user_registration'
    put 'users' => 'devise/registrations#update', :as => 'user_registration'
  end
  resources :approvers
  resources :owners
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "orders#index"
  resources :projects
  resources :orders
  resources :suppliers
  resources :owners
end
