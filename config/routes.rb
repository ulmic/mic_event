MicEvents::Application.routes.draw do
  resources :places
  resources :users
  resources :members
  resources :checkins
end
