Rails.application.routes.draw do
  resources :vacancies

  post '/vacancies/:id/activate', to: 'vacancies#activate'

  get '/category/:id', to: 'vacancies#percentage'

  post '/loadJobs', to: 'vacancies#loadJobs'
  
end
