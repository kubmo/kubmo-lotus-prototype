Rails.application.routes.draw do
  root to: 'users#new'

  resources :users
  resource :verifications
end
