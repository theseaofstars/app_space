Rails.application.routes.draw do



  get 'sessions/new'

  get '/about', to: 'static_pages#about'

  get '/help',to: 'static_pages#help'

  get '/contact',to: 'static_pages#contact'

  get '/signup',to: 'users#new'

  get '/login', to: 'sessions#new'

  root 'static_pages#home'

  resources :users

  resources :sessions, only: [:create,:destroy]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
