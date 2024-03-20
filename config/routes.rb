Rails.application.routes.draw do
  devise_for :users
  
  root 'artworks#index' 
  
  resources :artworks, only: [:index]
  resources :collections, only: [:index]
  resources :artists, only: [:index]
  resources :fake_artworks, only: [:index]
  resources :artworks, only: [:show]
  resources :artworks, only: [:show]


  get 'about', to: 'about#index'
  get 'collection_navigation', to: 'artworks#collection_navigation', as: 'collection_navigation'


  
  # Other routes
end
