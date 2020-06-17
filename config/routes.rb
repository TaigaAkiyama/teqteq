Rails.application.routes.draw do
  root to: 'toppages#index'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  get 'signup', to: 'users#new'
 
  resources :users, only: [:index, :show, :new, :create, :edit, :update] do
    member do 
      get :user_answers
    end
  end
  
  resources :questions do
   resources :answers, only: [:create, :edit, :update, :destroy]
  end
end

