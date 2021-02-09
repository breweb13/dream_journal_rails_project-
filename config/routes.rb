Rails.application.routes.draw do
  
  root to: 'sessions#welcome'
  resources :users
  resources :dreams 
  resources :feelings
  resources :dream_journals do
    resources :dreams, :feelings 
  end
  get '/dream_journals/most_recent' => 'dream_journals#most_recent'
  #7 RESTful routes = resources
  
  #both get/post patch/delete
  match '/auth/:google_oauth2/callback' => 'sessions#google', via:[:get,:post] #controller:method
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end
