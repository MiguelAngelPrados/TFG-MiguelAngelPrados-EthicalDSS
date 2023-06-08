Rails.application.routes.draw do

  get "signup" => "users#new"
  get "login" => "sessions#new"
  get "logout" => "sessions#destroy"

  get "recommendations" => "recommendations#index"
  get "recommendations/:patient_id" => "recommendations#new"
  get "recommendations/:patient_id/result" => "recommendations#result"

  
  resources :users, except: [:index, :new]
  resources :sessions, except: [:index, :edit, :update, :show, :new, :destroy]
  resources :patients do
    resources :diagnoses
  end
  resources :medical_teams
  resources :interventions
  
  # Defines the root path route ("/")
  root "patients#index"
end
