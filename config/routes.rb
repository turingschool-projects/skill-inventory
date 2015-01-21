Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :skills, only: [:index, :create, :show, :update, :destroy], defaults: { format: :json }
      resources :groups, only: [:index], defaults: { format: :json }
    end
  end
end
