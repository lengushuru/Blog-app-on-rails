Rails.application.routes.draw do
  root "users#index"

  resources :users, only: [:index, :show] do
    resources :post, only: [:index, :show]
  end
end
