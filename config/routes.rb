Rails.application.routes.draw do

  root "articles#index"

  devise_for :users, :controllers => { registrations: 'registrations'}

  resources :articles do
    resources :comments
  end
end
