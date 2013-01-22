Trunkclub::Application.routes.draw do
  
  get "/login" => 'Sessions#new', :as => 'login'

  post "/sessions" => 'Sessions#create'

  get "/logout" => 'Sessions#destroy', :as => 'logout'

  get "sessions/new"

  get "sessions/create"

  get "sessions/destroy"

  get "/home" => "pages#home", :as => "home"

  resources :affiliates

  get "/signup" => 'Affiliates#new', :as => 'signup'

  get "approve_enrollment" => 'affiliates#approve_enrollment', :as => 'approve'
  
  root :to => 'Pages#home'

end