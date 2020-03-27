Rails.application.routes.draw do
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'
  }
  root "products#index"
  resources :products, only: [:show,:new]
  resources :users, only: [:show] do
    collection do
      get 'logout'
    end
    collection do
      get 'credit'
    end
  end
  
  devise_scope :user do
    get "residences", :to => "users/registrations#new_residence"
    post "residences", :to => "users/registrations#create_residence"
    get "login", :to => "users/sessions#new"
    get "logout", :to => "users/sessions#destroy"
  end

end
