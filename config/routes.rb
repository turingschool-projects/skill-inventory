Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :skills, only: [:index, :create, :show, :update, :destroy], defaults: { format: :json }
      resources :ratings, defaults: { format: :json }
      resources :sections, only: [:index], defaults: { format: :json }
      resources :sessions, only: [:create]
    end
  end
end
