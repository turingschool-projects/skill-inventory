Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :skills, only: [:index, :create, :show, :update, :destroy], defaults: { format: :json }
      resources :groups, only: [:index], defaults: { format: :json }
      resources :sessions, only: [:create]
    end
  end

  get '/auth/:provider/callback', to: 'sessions#create', as: 'login'
end
