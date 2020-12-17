Rails.application.routes.draw do
  root 'main_pages#top'
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  resources :users do
    resource :profile, :only => [:edit, :update]
  end
  resources :events do
    resources :members, :only => [:create, :update, :destroy]
  end
  resources :informations
end
