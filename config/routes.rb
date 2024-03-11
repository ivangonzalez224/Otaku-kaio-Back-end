Rails.application.routes.draw do
  
  devise_for :users, path: 'auth', path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    registration: 'signup'
  },
  controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  # Define the root path route ("/")
  devise_scope :user do
    authenticated :user do
      root to: 'dashboard#index', as: :authenticated_root
    end

    unauthenticated do
      root to: 'dashboard#index', as: :unauthenticated_root
    end
  end
  
  namespace :api do
    namespace :v1 do
      resources :products, only: [:index, :show, :create, :destroy]
    end
  end

  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
