Rails.application.routes.draw do
  devise_for :users
  root 'posts#index'
  resources :posts do
    resources :praises, only: [:create, :destroy, :edit, :update] do
      resources :bests, only: :create
    end
  end
  resources :users, only: [:edit, :update, :show]
end
