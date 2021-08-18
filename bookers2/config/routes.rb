Rails.application.routes.draw do
  get 'users/index'
  get 'users/show'
  get 'users/edit'
  get 'users/update'
  devise_for :users
  root to: 'homes#top'
  resources :books, only: [:create, :edit, :update, :index, :show, :destroy]
  resources :users, only: [:index, :show, :edit, :update]
  get 'home/about' => 'homes#about' , as: 'about'
end
