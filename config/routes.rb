Lunchy::Application.routes.draw do
  
  resources :locations

  get "pages/home"
  get "pages/contact"

  resources :restaurants
  resources :users
  
  match "/", :to => "home#index", :via => "get"
  match '/signup',  :to => 'users#new'
  
  match "/", :to => "users#login", :via => "post"
  
  match "/users/:id", :to => "locations#new", :via => "post"
end
