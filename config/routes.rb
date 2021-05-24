Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  get 'users/show_follow' => 'users#following'
  get 'users/show_follower' => 'users#follower'
  resources :post_images do
    resource :favorites, only: [:create, :destroy]
    resources :post_comments, only: [:create, :destroy]
  end
  resources :users, only: [:show, :edit, :update, :index]
  resources :relationships, only: [:create, :destroy]
end