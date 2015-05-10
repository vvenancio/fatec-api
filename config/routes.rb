Rails.application.routes.draw do
  
  get 'notices/selected', to: 'notice#show_selected', defaults: { format: 'json' }
  get 'internships/selected', to: 'internship#show_selected', defaults: { format: 'json' }
  get 'courses/all', to: 'course#index', defaults: { format: 'json' }
  get 'courses/:id', to: 'course#show', defaults: { format: 'json' }
  get 'enterprises/all', to: 'enterprise#index', defaults: { format: 'json' }
  get 'internships/all', to: 'internship#index', defaults: { format: 'json' }
  get 'notices/all', to: 'notice#index', defaults: { format: 'json' }
  
end