Rails.application.routes.draw do
  root 'main_pages#top'

  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  resources :users do
    resource :profile, :only => [:edit, :update]
    resources :records
    resource :relationships, only: [:create, :destroy]
      get :follows, on: :member 
      get :followers, on: :member 
  end

  resources :events do
    resources :members, :only => [:create, :update, :destroy]
    resources :comments, :only => [:create, :destroy]
  end
  
  resources :informations do
    resource :favorites, :only => [:create, :destroy]
  end
  
end
