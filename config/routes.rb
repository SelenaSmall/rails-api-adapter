Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'users#index'

  resources :gits, only: [:index]
  resources :users, only: [:new, :create, :destroy, :show]
end
