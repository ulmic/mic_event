MicEvents::Application.routes.draw do
  root to: "welcome#index"
  resources :pages do
    collection do
      get :you_are_busted
      get :privacy
    end
  end
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
      resources :admins, except: [ :show, :index ]
    end
  end
  resources :admins, only: :index
  resources :members, except: [ :show, :new, :update ]
  get ":id" => "members#show", as: "member"
  put ":id" => "members#update"
  resources :programs
  resources :errors, only: [] do
    collection do
      get :not_found
    end
  end
  namespace :admin do
    resources :users, except: [ :show, :destroy ] do
      member do
        put :accept
        put :bust
        put :retrieve
      end
    end
  end
end
