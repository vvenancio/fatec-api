Rails.application.routes.draw do

  resources :notices
  
  resources :courses
  
  resources :enterprises do
    resources :internships
  end
  
end