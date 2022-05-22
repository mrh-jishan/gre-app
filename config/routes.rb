Rails.application.routes.draw do

  namespace :api, defaults: {format: 'json'} do
    root :to => 'api#index'
    namespace :v1 do
      post 'sign_up', to: 'registrations#create'
      post 'sign_in', to: 'sessions#create'
      resources :study_plans, only: [:index] do
        resources :quizzes, only: [:index]
        resources :vocabulary_sets, only: [:index]
      end
      resources :vocabularies, only: [:index]
    end
  end

  root 'welcome#index'

  get 'sign_up', to: 'registrations#new'
  post 'sign_up', to: 'registrations#create'

  get 'sign_in', to: 'sessions#new'
  post 'sign_in', to: 'sessions#create', as: 'log_in'
  delete 'logout', to: 'sessions#destroy'

  get 'password', to: 'passwords#edit', as: 'edit_password'
  patch 'password', to: 'passwords#update'

  resources :vocabularies

  resources :study_plans do
    resources :quizzes, only: [:index]
    resources :vocabulary_sets
  end
end
