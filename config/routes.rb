Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :tags, only: [:index, :create, :show, :update, :destroy], defaults: { format: :json }
      resources :skills, except: [:new, :edit], defaults: { format: :json }
      resources :ratings, except: [:new, :edit], defaults: { format: :json }
      resources :sections, only: [:index, :show], defaults: { format: :json }
      resources :sessions, only: [:create], defaults: { format: :json }

      namespace :instructor do
        resources :skills, only: [:index, :show]
        resources :ratings, only: [:index, :show]
      end
    end
  end

  get '/auth/:provider/callback', to: 'sessions#create', as: 'login'
end
