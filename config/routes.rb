Rails.application.routes.draw do
  resources :devices do
    resources :batteries
    resources :battery_histories
  end
  resources :battery_histories
  resources :sleep_plan_histories
  resources :level_histories
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
