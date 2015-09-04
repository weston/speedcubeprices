Rails.application.routes.draw do
  root 'welcome#index'
  resources :search
  resources :about
end
