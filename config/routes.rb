Rails.application.routes.draw do
  mount Ckeditor::Engine => "/ckeditor"
  get  "/signup", to: "users#new"
  post "/signup", to: "users#create"
  get  "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  resources :users
  resources :account_activations, only: :edit
  resources :password_resets, except: %i(index show destroy)
  resources :books, except: %i(index new)
  resources :categories
  scope "(:locale)", locale: /en|vi/ do
    root "static_pages#home"
  end
end
