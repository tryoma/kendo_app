Rails.application.routes.draw do
  root 'main_pages#top'
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  resources :users
  resources :events
  resources :informations
end
