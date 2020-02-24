Rails.application.routes.draw do
  resources :sources
  resources :links
  resources :clicks
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
