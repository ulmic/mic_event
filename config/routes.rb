MicEvents::Application.routes.draw do
  root to: "welcome#index"
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
  resources :errors, only: [] do
    collection do
      get :not_found
    end
  end
  resources :admins, except: :show
end
