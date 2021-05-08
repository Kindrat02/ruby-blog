Rails.application.routes.draw do

  post 'search', to: "users#search"

  devise_for :users, :controllers => { registrations: 'registrations'}

  devise_scope :user do
    authenticated :user do
      root 'users#index', as: :authenticated_root
    end

    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end

  resources :users
  resources :articles do
    resources :comments
  end
end
