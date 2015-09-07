Rails.application.routes.draw do
  root 'welcome#index'
  resources :search
  resources :about
  resources :shipping
  resources :sales do
    get :store, on: :collection
    get :post_submit, on: :collection
    get :admin, on: :collection
    get :post_admin, on: :collection
    get :delete_promotion, on: :collection
    get :approve_promotion, on: :collection
  end
end
