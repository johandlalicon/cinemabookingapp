Rails.application.routes.draw do
  
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  root 'static_pages#home'

  get 'static_pages/home'
  get 'static_pages/about'

  namespace :admin do
    get 'dashboard', to: 'dashboard#index'
    resources :screenings, only: [:new, :create, :show]
  end

  
end
