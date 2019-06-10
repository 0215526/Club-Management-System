Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }
  root to: 'homes#index'
  resources :homes
  resources :users
  delete "homes/:id", to: "homes#destroy"
  match '/homes/makeAdmin/:id',   to: 'homes#makeAdmin',   via: 'get', :as => :users_makeAdmin
  match '/homes/revokeAdmin/:id',   to: 'homes#revokeAdmin',   via: 'get', :as => :users_revokeAdmin
end
