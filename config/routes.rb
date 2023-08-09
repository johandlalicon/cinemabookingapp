Rails.application.routes.draw do
  authenticated :user do
    get '/user_dashboard', to: 'user_dashboard#index', as: :user_dashboard
  end
  
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  resources :movies, only: [:index, :show]
  resources :bookings, only: [:new, :create]
  resources :malls, only: [:index, :show]
  
  root 'static_pages#home'

  get 'static_pages/home'
  get 'static_pages/about'

  namespace :admin do
    get 'dashboard', to: 'dashboard#index'
    resources :screenings, only: [:new, :create, :show, :index, :destroy] do
      collection do
        get :timeslots
      end
    end
    resources :malls, only: [:index, :new, :create, :show, :destroy] do
      get 'create_movie', on: :member
      post 'save_movie', on: :member
      delete 'destroy_movie', on: :member
    end
  end

  # match "*path", to: "application#not_found", via: :all
  
end
