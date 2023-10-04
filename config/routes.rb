Rails.application.routes.draw do
  devise_for :users
  root :to => "homes#top"
  get 'home/about' => 'homes#about', as: 'about'
  resources :users, only: [:index,:edit,:destroy,:update] do
    collection do
      get 'sort'
    end
  end

  resources :cakes do
    collection do
      get 'sort'
    end
  end
  get 'cake/thanks' => 'cakes#thanks', as: 'thanks'
end
