Rails.application.routes.draw do
  get 'turn/next'

  namespace :cities do
    resources :city_resources, only: [:index]
    resources :city_society, only: [:index] do
      collection do
        post :create_citizen
      end
    end
  end

  resources :cities do
    collection do
      get :current
    end
  end

  root 'dashboard#index'

  resources :dashboard, only: [:index]
  resources :users

  namespace :city_workers do
    resources :workers, only: [] do
      collection do
        put :update
      end
    end
  end

  devise_for :credentials, controllers: {registrations: 'registrations'}
end
