Rails.application.routes.draw do
  resources :feelings
  root to: 'sessions#welcome'
  resources :dreams #7 RESTful routes
  resources :dream_journals
  resources :users
  
  #both get/post patch/delete
  match '/auth/:google_oauth2/callback' => 'sessions#google', via:[:get,:post] #controller:method
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end
