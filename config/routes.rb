Rails.application.routes.draw do
 root 'blogs#index'
 devise_for :users
 resources :blogs do
  resources :comments, only:  [:create]
end
  resources :users, only: [:show]
end
