Rails.application.routes.draw do

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'homes#top'
  get 'home/about' => 'homes#about'
  get 'user/personal/:id' => 'users#personal',as:"user_personal"

  resources :users, only: [:index, :show, :edit, :update]
  resources :posts


end

