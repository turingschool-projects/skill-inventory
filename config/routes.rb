Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      # namespace :admin do
        # resources :skills
      # end
      resources :skills
    end
  end
end
