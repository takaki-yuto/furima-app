Rails.application.routes.draw do
  get 'card/new'
  get 'card/show'
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'
  }
  root "products#index"
  resources :products, only: [:show,:new]
  resources :users, only: [:show] do
    collection do
      get 'logout'
      get 'credit'
    end
  end
  resources :card, only: [:new, :show] do
    collection do
      post 'show', to: 'card#show'
      post 'pay', to: 'card#pay'
      post 'delete', to: 'card#delete'
    end
  end

  devise_scope :user do
    get "residences", :to => "users/registrations#new_residence"
    post "residences", :to => "users/registrations#create_residence"
    get "login", :to => "users/sessions#new"
    get "logout", :to => "users/sessions#destroy"
  end

end
