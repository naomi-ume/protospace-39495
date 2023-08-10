Rails.application.routes.draw do
  devise_for :users
  get 'prototypes/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to: "prototypes#index"
  resources :prototypes do
   resources :comments, only: [:index, :create, :new , :update]
  end
   resources :users, only: [:index, :new, :create, :update, :show]
   
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  
end
