Rails.application.routes.draw do

  get 'relationships/create'
  get 'relationships/destroy'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'homes#top'
  get 'home/about' => 'homes#about'
  get 'user/personal/:id' => 'users#personal',as:"user_personal"
  get 'user/favorite/:id' => 'users#favorite',as:"user_favorite"
  get 'search' => 'searchs#search'

  resources :users, only: [:index, :show, :edit, :update] do
    resource :relationships, only: [:create, :destroy]
    get :follows, on: :member
    get :followers, on: :member
  end
  resources :posts do
    resources :comments, only:[:create, :destroy]
    resource :nices, only: [:create, :destroy]
  end


end

