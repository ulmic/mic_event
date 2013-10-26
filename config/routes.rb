MicEvents::Application.routes.draw do
  root to: "welcome#index"
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  resources :places
  resources :users
  resources :members
  resources :events do
    member do
      resources :checkins
    end
  end
  resource :welcome, only: :index
  resources :session do
    member do
      delete :destroy
    end
  end
end
