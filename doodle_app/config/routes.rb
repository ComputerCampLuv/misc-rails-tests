Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  resources :items do
    resources :comments
  end
  get 'search' => 'items#search'
end
