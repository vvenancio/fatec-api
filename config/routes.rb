Rails.application.routes.draw do

  devise_for :users
  resources :notices
  
  resources :courses
  
  resources :enterprises do
    resources :internships
  end
  
end