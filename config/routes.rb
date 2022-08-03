Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "homes#top"
  get "home/about"=>"homes#about", as: 'about'

  resources :books, only: [:index,:show,:edit,:create,:destroy,:update]
  resources :users, only: [:update, :edit, :index, :show]
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
 end 