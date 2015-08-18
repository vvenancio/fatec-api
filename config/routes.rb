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
  
end