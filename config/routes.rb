Rails.application.routes.draw do
  root 'main_pages#top'
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  resources :users do
    resource :profile, :only => [:edit, :update]
    resources :records
  end
  resources :events do
    resources :members, :only => [:create, :update, :destroy]
  end
  resources :informations do
    resource :favorites, only: [:create, :destroy] 
  end
  
end
