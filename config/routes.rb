Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :skills, except: [:new, :edit], defaults: { format: :json }
      resources :ratings, except: [:new, :edit], defaults: { format: :json }
      resources :sections, only: [:index], defaults: { format: :json }
      resources :sessions, only: [:create]
    end
  end

  get '/auth/:provider/callback', to: 'sessions#create', as: 'login'
end
