Rails.application.routes.draw do
  root "experiments#index"
  devise_for :users

  resources :examples
  resources :experiments

  get "up" => "rails/health#show", :as => :rails_health_check
end
