Rails.application.routes.draw do
  get 'sessions/new'
  get 'users/new'
  root 'tests#index'

  get :signup, to: 'users#new'
  get :login, to: 'sessions#new'
  get :singout, to: 'sessions#singout'
  delete :logout, to: 'sessions#destroy'

  resources :users, only: :create
  resources :sessions, only: %i[new create destroy]

  resources :tests do
    resources :questions, shallow: true, except: :index do
      resources :answers, shallow: true, except: :index
    end

    member do
      post :start
    end
  end

  resources :test_passages, only: %i[show update] do
    member do
      get :result
    end
  end
end