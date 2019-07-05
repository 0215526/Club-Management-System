Rails.application.routes.draw do
  root to: 'homes#index'
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
  resources :homes
  resources :users
  delete "homes/:id", to: "homes#destroy"
  match '/homes/makeAdmin/:id',   to: 'homes#makeAdmin',   via: 'get', :as => :users_makeAdmin
  match '/homes/revokeAdmin/:id',   to: 'homes#revokeAdmin',   via: 'get', :as => :users_revokeAdmin
end
