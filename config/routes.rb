Rails.application.routes.draw do
  resources :events do
    resources :tickets
  end
  get 'session/new'

  resources :users


  get  '/signup',  to: 'users#new'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'events#index'

  resources :tickets do
    collection do
      get :cancel
      patch :confirm_cancel
      get :history
    end
  end

  #get '/history', to: 'ticket#history'


  get    '/login',   to: 'session#new'
  post   '/login',   to: 'session#create'
  delete '/logout',  to: 'session#destroy'

  post '/signup', to: 'users#create'
end
