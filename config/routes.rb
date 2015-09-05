Rails.application.routes.draw do
  root 'welcome#index'
  resources :search
  resources :about
  resources :shipping
  resources :sales
end
