Rails.application.routes.draw do
  resources :posts
  namespace :api do
    namespace :v1 do
      resources :blogs, only: [ :index, :show, :new, :create, :update, :destroy ]
      post "/signup", to: "signup#create"
      post "/signin", to: "signin#create"
    end
  end
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :my_app
  resources :my_page
  resources :my_pages
  resources :my_page2
  resources :blogs do
    resources :comments, only: [ :create, :destroy ]
    collection do
      get "my_blogs"
    end
  end
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # get 'Login', to: 'my_page#show'
  get "blog/:id", to: "blogs#show"
  get "my_page/:id", to: "my_page#show"
  root "my_app#index"
end
