Rails.application.routes.draw do
  resources :activities
  resources :resources
  resources :resources
  resources :events
  resources :resources
  resources :beneficiaries
  resources :areas
  resources :institutes
  resources :usuarios, except: [:destroy]
  devise_for :users

  root to: 'landing_page#index' 
  get 'inicio' => 'landing_page#index'

  devise_scope :user do
    get "login", to: "devise/sessions#new", as: :login
  end
end
