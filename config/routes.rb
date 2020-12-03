Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  resources :users, only: [:create, :index]
  resources :purchase_address, only:[:create]
  
  resources :items do
    resources :purchase_records, only:[:index, :create]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
