Rails.application.routes.draw do
  devise_for :users, skip: %i[registrations]
  as :user do
    get 'users/edit' => 'devise/registrations#edit', :as => 'edit_user_registration'
    put 'users' => 'devise/registrations#update', :as => 'user_registration'
  end
  get 'dashboard', to: 'dashboard#index'
  root "dashboard#index"
  get '/ficha-producao/:id', to: 'production_sheets#edit', as: 'public_production_sheet'
  resources :approvers
  resources :owners
  resources :projects
  resources :orders do
     get 'budget_request', on: :member
     get 'print', on: :member
  end
  resources :suppliers
  resources :owners
  resources :people do
     post 'import_file', on: :collection
  end
  resources :events
  resources :hires
  resources :production_sheets, only: %i[edit update] do
    get 'print', on: :member
  end
end
