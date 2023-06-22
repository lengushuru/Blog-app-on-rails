Rails.application.routes.draw do
  resources :likes
  resources :posts
  resources :comments
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
