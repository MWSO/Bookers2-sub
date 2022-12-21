Rails.application.routes.draw do
 devise_for :users
 resources :users, only: [:index, :show, :edit, :update]
 resources :books, only: [:new, :show, :index, :edit, :create, :update, :destroy]
  root to: "homes#top"
  get 'homes/about'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
