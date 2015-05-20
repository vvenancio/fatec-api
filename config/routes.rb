Rails.application.routes.draw do
  
  get 'notices/selected', to: 'notice#show_selected', defaults: { format: 'json' }
  get 'internships/selected', to: 'internship#show_selected', defaults: { format: 'json' }
  get 'courses', to: 'course#index', defaults: { format: 'json' }
  get 'course/:id', to: 'course#show', defaults: { format: 'json' }
  get 'enterprises', to: 'enterprise#index', defaults: { format: 'json' }
  get 'enterprise/:id', to: 'enterprise#show', defaults: { format: 'json' }
  get 'internships', to: 'internship#index', defaults: { format: 'json' }
  get 'notices', to: 'notice#index', defaults: { format: 'json' }
  
end