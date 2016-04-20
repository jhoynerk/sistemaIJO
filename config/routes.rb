Rails.application.routes.draw do
  resources :activities
  resources :resources
  resources :resources
  resources :events
  resources :resources
  resources :beneficiaries
  resources :areas do
    get "/calendar", to: "areas#calendar", as: :calendar
  end
  resources :institutes
  resources :usuarios, except: [:destroy]
  devise_for :users, skip: [:registrations, :recoverable]
  root to: 'landing_page#index' 
  get 'inicio' => 'landing_page#index'

  devise_scope :user do
    get "login", to: "devise/sessions#new", as: :login
  end

  resources :users
  get 'prestamos', to: 'order#index', as: :prestamos
  post 'prestamos', to: 'order#create', as: :orden_created
  post 'resources/area_by', to: 'resources#resources_by', as: :by_recursos
  post 'areas/area_by', to: 'areas#areas_by', as: :by_areas

  get 'resource/type_resources', to: 'type_resources#index', as: :type_resources
  get 'resource/type_resources/new', to: 'type_resources#new', as: :new_type_resource
  get 'resource/type_resources/:id', to: 'type_resources#show', as: :type_resource
  post 'resource/type_resources', to: 'type_resources#create'
  get 'resource/type_resources/:id/edit', to: 'type_resources#edit', as: :edit_type_resource
  put 'resource/type_resources/:id', to: 'type_resources#update'
  patch 'resource/type_resources/:id', to: 'type_resources#update'
  delete 'resource/type_resources/:id', to: 'type_resources#destroy'
end
