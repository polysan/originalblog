Rails.application.routes.draw do
 root 'blogs#index'
 devise_for :users
 resources :blogs
 get '/users/:id' => 'users#show'
end
