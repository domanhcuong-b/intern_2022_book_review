Rails.application.routes.draw do
  scope "(:locale)", locale: /en|vi/ do
    root "static_pages#home"
    get "/login", to: "sessions#new"
    post "/login", to: "sessions#create"
    delete "/logout", to: "sessions#destroy"
    resources :books, only: %i(index show)
    resources :users, only: :show
    resources :reviews, only: %i(index create destroy)
    resources :stars, only: :index
  end
end
