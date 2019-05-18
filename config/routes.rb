Rails.application.routes.draw do
  resources :level_raws
  resources :batteries
  resources :quips
  resources :sparks
  resources :events

  resources :levels
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
