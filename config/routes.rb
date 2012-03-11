Lunchy::Application.routes.draw do
  
  resources :locations
  resources :users
  
  get "pages/home"
  get "pages/contact"

  
  match "/", :to => "home#index", :via => "get"
  match '/signup',  :to => 'users#create'
  match "/", :to => "users#login", :via => "post"
  match "/locations", :to => "locations#create", :via => "post"
  match "/locations/edit", :to => "locations#edit", :via => "get"
  match "/restaurants", :to => "restaurants#index", :via => "get"
  match "/restaurants", :to => "restaurants#search", :via => "post"
end
