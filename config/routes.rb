Rails.application.routes.draw do
  resources :teams
  post    '/teams/:id',   to: 'teams#change_players'
  resources :users do
  	member do
  	 	get 'teams'
 	end
  end
  resources :players
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
