Rails.application.routes.draw do
  get "reviews/new"
  get "reviews/create"
  get "reviews/index"
  get "reviews/testimonials"
  get "inquiries/new"
  get "inquiries/create"
  get "model_applications/new"
  get "model_applications/create"
  get "gallery_images/index"
  get "testimonials", to: "reviews#testimonials"
  get "/about", to: "pages#about"
  get "/gallery", to: "gallery_images#index", as: :gallery
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")

  root "pages#home"

  resources :model_applications, only: [ :new, :create ]
  resources :inquiries, only: [ :new, :create ]
  resources :reviews, only: [ :new, :create, :index ]
end
