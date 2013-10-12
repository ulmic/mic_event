MicEvents::Application.routes.draw do
  root to: "welcome#index"
  resources :places
  resources :users
  resources :members
  resources :checkins
  resources :events
  resource :welcome, only: :index
end
