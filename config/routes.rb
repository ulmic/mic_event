MicEvents::Application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  root to: "welcome#index"
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
    collection do
      delete :destroy
    end
  end
end
