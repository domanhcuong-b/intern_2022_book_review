Rails.application.routes.draw do
  scope "(:locale)", locale: /en|vi/ do
    root "static_pages#home"
    get "/login", to: "sessions#new"
    post "/login", to: "sessions#create"
    delete "/logout", to: "sessions#destroy"
    resources :books, only: %i(index show)
    resources :users do
      member do
        get :following, to: "following#index"
        get :followers, to: "followers#index"
      end
    end
    resources :reviews, except: %i(new show)
    resources :stars, only: :index
    resources :users_relationships, only: %i(create destroy)

    namespace :admin do
      root "static_pages#index"
      resources :static_pages, only: :index
      resources :books, except: :show
    end
  end
end
