Rails.application.routes.draw do
  devise_for :users, skip: :all
  devise_scope :user do
    patch '/api/v1/password', to: 'devise/passwords#update'
    put '/api/v1/password', to: 'devise/passwords#update'
    post '/api/v1/password', to: 'devise/passwords#create'

    namespace :api, defaults: { format: :json } do
      namespace :v1 do
        get 'confirmation', to: 'users/confirmations#show'
        post 'login', to: 'users/sessions#create'
        delete 'logout', to: 'users/sessions#destroy'
        
        patch 'signup', to: 'users/registrations#update'
        put 'signup', to: 'users/registrations#update'
        delete 'signup', to: 'users/registrations#destroy'
        post 'signup', to: 'users/registrations#create'
      end
    end
  end
end
