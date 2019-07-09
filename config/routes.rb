Rails.application.routes.draw do
  root to: 'news#index'
  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :events do
    resource :clubs
    match '/clubs/:id',   to: 'clubs#register_to_event',   via: 'get', :as => :register_to_event
  end
  # devise_scope :user do
  #   get "signup", to: "devise/registrations#new"
  #   get "login", to: "devise/sessions#new"
  #   get "logout", to: "devise/sessions#destroy"
  # end
  resources :news
  resources :users
  delete "users/:id", to: "users#destroy"
  match '/users/makeAdmin/:id',   to: 'users#makeAdmin',   via: 'get', :as => :users_makeAdmin
  match '/users/revokeAdmin/:id',   to: 'users#revokeAdmin',   via: 'get', :as => :users_revokeAdmin
end
