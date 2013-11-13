MicEvents::Application.routes.draw do
  root to: "welcome#index"
  resources :places
  resources :events do
    member do
      resources :checkins, except: :show
    end
  end
  resource :welcome, only: :index do
    collection do
      get :about
      get :contacts
    end
  end
  resource :session, only: [ :new, :create, :destroy ]
  resources :users, only: [ :new, :create ] do
    member do
      resources :members, only: :new
    end
  end
  resources :members, except: [ :show, :new ] do
    member do
      resources :admins, except: :show
    end
  end
  get ":number" => "tickets#show", as: "ticket"
  resources :programs
  resources :errors, only: [] do
    collection do
      get :not_found
    end
  end
end
