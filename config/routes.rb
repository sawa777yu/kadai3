Rails.application.routes.draw do
  root to: 'homes#top'
  get 'homes' => 'homes#about'
  devise_for :users
  resources :books, only: [:create, :index, :show, :edit, :destroy]
  resources :users, only: [:show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
