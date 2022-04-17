Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users

  root to: 'biens#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :biens do
    collection do
      get :userbiens
    end
  end
end
