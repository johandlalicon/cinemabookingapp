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
  end

  
end
