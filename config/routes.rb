Rails.application.routes.draw do
  root to: 'home#index'

  namespace :bff, defaults: { format: :json } do
    namespace :v1 do
      post 'authenticate', to: 'auth#login'
      resources :users
    end
  end
end
