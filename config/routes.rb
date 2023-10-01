Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:index,:edit,:destroy,:update]
  root :to => "homes#top"
  get 'home/about' => 'homes#about', as: 'about'
resources :cakes
end
