Rails.application.routes.draw do
  get '/stats', to: 'urls#index'
  resources :urls, only: [:create]
  root to: 'urls#new', :as => '/'
  get 'clicked', to: 'urls#clicked'
end
