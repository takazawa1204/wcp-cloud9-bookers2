Rails.application.routes.draw do
  root to: 'homes#top'
  devise_for :users
  get '/about' => 'homes#about', as: 'about'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :books, only: [:create, :index, :show, :edit, :update, :destroy]

  resources :users, only: [:index, :show, :edit, :update]
end
