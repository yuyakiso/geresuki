Rails.application.routes.draw do
  devise_for :users
  root to: "gerendes#index"
  resources :gerendes, only: [:index, :show] do
    resources :comments, only: [:create, :destroy]
    collection do
      get 'search'
    end
  end
end
