MicEvents::Application.routes.draw do
  root to: "welcome#index"
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  resources :places
  resources :users
  resources :members
  resources :events do
    member do
      resources :checkins, except: :show
    end
  end
  resource :welcome, only: :index
  resource :session, only: [ :new, :create, :destroy ]
end
