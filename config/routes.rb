Rails.application.routes.draw do
  root to: 'homes#top'
  get 'home/about' => 'homes#about'
  devise_for :users
  resources :books, only: [:create, :index, :show, :edit, :destroy]
  resources :users, only: [:show, :update]
  get 'users/:id/edit' => 'users#edit', as: 'edit'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
