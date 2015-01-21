Rails.application.routes.draw do
  root 'dashboard#index'

  get '/auth/github/callback' => 'sessions#create'

  # match "/ember_app" => redirect("http://localhost:4200/"), :as => :ember_app

  namespace :api do
    namespace :v1 do
      resources :skills, only: [:index, :create], defaults: { format: :json }
      resources :groups, only: [:index], defaults: { format: :json }
    end
  end
end
