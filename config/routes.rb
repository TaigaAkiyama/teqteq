Rails.application.routes.draw do
  root to: 'toppages#index'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  get 'signup', to: 'users#new'
 
  resources :users, only: [:index, :show, :new, :create, :edit, :update] do
    member do 
      get :answers, to: 'users#answered_questions'
    end
  end
  
  resources :questions do
    #collection do
     # get :search
    #end
    resources :answers, only: [:create, :edit, :update, :destroy] do
      resources :comments, only: [:index, :new, :create]
    end
  end
end

