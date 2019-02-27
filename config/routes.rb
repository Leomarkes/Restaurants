Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'restaurantes#index'
  resources :restaurantes, except: [:index] do
    member do
      get 'avaliar'
      post 'avaliar', to: 'restaurantes#newavaliar'
    end
  end

  get 'signup', to: 'users#new'
  resources :users, except: [:new]

  resources :comentarios, except: [:show, :index, :new, :create]

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
end
