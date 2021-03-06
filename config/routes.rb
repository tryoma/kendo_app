Rails.application.routes.draw do
  post '/callback', to: 'linebot#callback'
  root 'main_pages#top'

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    passwords: 'users/passwords'
  }

  resources :users do
    resource :profile, only: [:edit, :update]
    resources :records
    resource :relationships, only: [:create, :destroy]
    get :follows, on: :member
    get :followers, on: :member
  end

  namespace :api, format: 'json' do
    resources :lists, only: [:index, :create, :destroy, :update]
  end

  resource :lists, only: [:show]

  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end

  resources :events do
    resources :members, only: [:create, :update, :destroy]
    resources :comments, only: [:create, :destroy, :index]
  end

  resources :informations do
    resource :favorites, only: [:create, :destroy]
  end
end
