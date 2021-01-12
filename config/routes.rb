Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :games, only:[:create]
  resources :cases, only:[:update]
end
