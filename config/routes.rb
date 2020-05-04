Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :study_records
  resources :answers
  resources :study_sets
  devise_for :users, path: 'users', 
    controllers: { sessions: "users/sessions", 
    passwords: 'users/passwords',
    registrations: "users/registrations" }
  resources :sources
  resources :links do
  	resources :entries, controller: 'links/entries'  	
  end
  resources :clicks

  root to: "links#index"


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
