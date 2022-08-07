Rails.application.routes.draw do
  get 'relationships/followings'
  get 'relationships/followers'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "homes#top"
  get "home/about"=>"homes#about", as: 'about'

  resources :books, only: [:index,:show,:edit,:create,:destroy,:update] do
     resource :favorites, only: [:create, :destroy]
     resources :book_comments, only: [:create, :destroy]
  end
  resources :users, only: [:update, :edit, :index, :show]

  resouces :users do
    resource :relationships,only: [:create, :destroy]
    get 'followings' => 'relationships#follwings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'follwers'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
 end
