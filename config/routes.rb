Rails.application.routes.draw do
  post '/sparks', to: 'ingest#create'

  resources :spark_diagnostics
  resources :sleep_plans
  resources :level_raws
  resources :batteries
  resources :quips
  resources :events
  resources :levels

  resources :sparks
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
