Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  root "musics#index"

  # Define routes for the Music resource
  resources :musics

  get '/home', to: 'musics#home'
  get '/lets_go', to: 'musics#lets_go'


end
