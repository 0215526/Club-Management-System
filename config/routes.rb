Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }
  root to: 'homes#index'
  resources :homes
  resources :users
  delete "homes/:id", to: "homes#destroy"

end
