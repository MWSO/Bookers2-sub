Rails.application.routes.draw do
 devise_for :users
 resources :users, only: [:show, :edit]
 resources :books, only: [:new, :show, :index, :create, :destroy]
  root to: "homes#top"
  get 'homes/about'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
