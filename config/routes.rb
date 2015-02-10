Bestpetholidays::Application.routes.draw do
  get '/hostadmin(/:year(/:month))' => 'home#hostadmin', :as => :home, :constraints => {:year => /\d{4}/, :month => /\d{1,2}/}
  get '/calendar(/:year(/:month))' => 'calendar#index', :as => :calendar, :constraints => {:year => /\d{4}/, :month => /\d{1,2}/}
  resources :reservations
  post "reservations/new" => "reservations#new"
  resources :locations

  devise_for :sitters, :controllers => {:registrations => "registrations"}
  root 'home#index'
  get "/hostadmin" => "home#hostadmin", as: :sitter_root
  devise_for :users, :controllers => {:registrations => "uregistrations"}
  resources :sitters
end
