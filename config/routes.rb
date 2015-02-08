Bestpetholidays::Application.routes.draw do

  resources :reservations
  post "reservations/new" => "reservations#new"
  resources :locations

  devise_for :sitters, :controllers => {:registrations => "registrations"}
  root 'home#index'
  get "/hostadmin" => "home#hostadmin", as: :sitter_root
  devise_for :users, :controllers => {:registrations => "uregistrations"}
  resources :sitters
end
