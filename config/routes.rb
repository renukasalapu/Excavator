Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :tickets, only: [:create]
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "tickets#index"
  resources :tickets, only: [:index, :show]
end
