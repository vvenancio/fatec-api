Rails.application.routes.draw do

  resources :notice
  
  resources :course
  
  resources :enterprise do
    resources :internship
  end
  
end