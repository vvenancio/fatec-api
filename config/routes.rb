Rails.application.routes.draw do

  devise_scope :user do
    root to: "devise/sessions#new"
  end

  devise_for :users
  resources :notices

  resources :courses

  resources :enterprises do
    resources :internships
  end

  namespace :admin do
    resources :users
  end

  namespace :api do
    namespace :v1 do
      resources :courses, only: [:index]
      resources :internships, only: [:index]
      resources :notices, only: [:index]
    end
  end
end
