MicEvents::Application.routes.draw do
  root to: "welcome#index"
  match "/404", to: "errors#not_found"
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  resources :places
  resources :events do
    member do
      resources :checkins, except: :show
    end
  end
  resource :welcome, only: :index
  resource :session, only: [ :new, :create, :destroy ]
  resources :users
  resources :members, except: :show
  get ":number" => "tickets#show", as: "ticket"
  resources :programs
end
