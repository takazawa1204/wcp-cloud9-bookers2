Rails.application.routes.draw do
  get 'users/show'
  root to: 'homes#top'
  devise_for :users
  get '/about' => 'homes#about', as: 'about'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  resources :books, only: [:new, :create, :index, :show, :update, :destroy]
  
  resources :users, only: [:index, :show, :edit, :update]
end
