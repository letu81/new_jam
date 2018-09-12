Rails.application.routes.draw do
  devise_for :users
  mount Redactor2Rails::Engine => '/redactor2_rails'
  #web
  root to: "home#index"

  get 'home' => 'home#index'
  get 'about' => 'home#about', as: :about
  get 'app' => 'home#wap', as: :app
  get 'contact' => 'home#contact', as: :contact
  get 'jobs' => 'home#jobs', as: :jobs
  get 'order' => 'home#order', as: :order
  get 'privacy' => 'home#privacy', as: :privacy
  get 'service' => 'home#service', as: :service
  get 'wap' => 'home#wap', as: :wap

  get 'download' => 'download#index', as: :download
  get 'download/:version' => 'download#show', as: :download_version

  resources :customizes, only: [:index, :show]
  resources :dynamics, only: [:index, :show]
  resources :news, only: [:index, :show]
  resources :partners, only: [:index]
  resources :products, only: [:index, :show]
  resources :addresses, only: [:index, :show, :create, :update, :destroy]

  get 'search' => 'search#query', as: :search

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  require 'sidekiq/web'
  authenticate :admin_user do
    mount Sidekiq::Web => '/sidekiq'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end