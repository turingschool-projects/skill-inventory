Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :tags, only: [:index, :create, :show, :update, :destroy], defaults: { format: :json }
      resources :skills, except: [:new, :edit], defaults: { format: :json }
      resources :ratings, except: [:new, :edit], defaults: { format: :json }
      resources :sessions, only: [:create], defaults: { format: :json }
      get "/skills/feature", to: "skills#feature", defaults: { format: :json }
      get "/skills/unfeature", to: "skills#unfeature", defaults: { format: :json }
      resources :users, defaults: { format: :json }
      resources :cohorts, defaults: { format: :json }

      namespace :instructor do
        resources :skills, only: [:index, :show]
        resources :ratings, only: [:index, :show]
      end
    end
  end

  get '/auth/:provider/callback', to: 'sessions#create', as: 'login'
end
