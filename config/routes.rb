Rails.application.routes.draw do
  mount Ckeditor::Engine => "/ckeditor"
  get  "/signup", to: "users#new"
  post "/signup", to: "users#create"
  get  "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  resources :users do
    resources :following, only: :index
    resources :followers, only: :index
  end
  resources :account_activations, only: :edit
  resources :books
  resources :categories
  resources :ratings, only: :update
  resources :relationships, only: %i(create destroy)

  scope "(:locale)", locale: /en|vi/ do
    root "static_pages#home"
  end
end
