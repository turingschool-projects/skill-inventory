Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :skills, only: [:index, :create], defaults: { format: :json }
      resources :groups, only: [:index], defaults: { format: :json }
      resources :sessions, only: [:create]
    end
  end
end
