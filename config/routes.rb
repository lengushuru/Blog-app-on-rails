Rails.application.routes.draw do
  devise_for :users
  root 'users#index'

  resources :users, only: %i[index show] do
    resources :posts, only: %i[index show new create] do
      resources :comments, only: %i[new create]
      post 'like', on: :member
    end
  end
end