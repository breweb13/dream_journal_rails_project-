Rails.application.routes.draw do
  resources :dreams
  resources :dream_journals
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
