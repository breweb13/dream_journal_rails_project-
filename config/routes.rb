Rails.application.routes.draw do
  root to: 'sessions#welcome'
  resources :dreams #7 RESTful routes
  resources :dream_journals
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
