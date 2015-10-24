Rails.application.routes.draw do

  devise_scope :user do
    root to: "devise/sessions#new"
  end

  devise_for :users, :skip => [:registrations]

  as :user do
    get 'users/edit' => 'devise/registrations#edit', :as => 'edit_user_registration'
    put 'users' => 'devise/registrations#update', :as => 'user_registration'
  end

  resources :notices
  resources :courses
  resources :enterprises do
    resources :internships
  end

  namespace :admin do
    resources :users, except: [:show]
    get '/dashboard' => 'dashboard#show', as: 'dashboard'
  end

  namespace :api do
    namespace :v1 do
      with_options only: [:index] do
        resources :courses
        resources :internships
        resources :notices
      end
    end
  end

  get '/dashboard' => 'dashboard#show', as: 'dashboard'
end
