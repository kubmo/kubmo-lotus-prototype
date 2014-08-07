Rails.application.routes.draw do
  root to: 'users#new'

  post 'twilio/voice' => 'twilio#voice'
  resources :users
  resources :verifications
end
