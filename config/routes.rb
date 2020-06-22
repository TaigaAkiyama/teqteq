Rails.application.routes.draw do
  root to: 'toppages#index'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  get 'signup', to: 'users#new'
 
  resources :users, only: [:index, :show, :new, :create, :edit, :update] do
  resources :messages, only: [:index, :create, :destroy]
    member do 
      get :answers, to: 'users#answered_questions'
      get :likes
    end
  end
  
  resources :questions do
    resources :answers, only: [:create, :edit, :update, :destroy] do
      resources :comments, only: [:index, :new, :create]
    end
  end
  
  resources :favorites, only: [:create, :destroy]
  
end

