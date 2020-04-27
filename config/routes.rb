Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  root 'records#index'

  get 'records/index'

  resources :activities, only: [:show, :index, :new, :create, :edit, :update]
  resources :records, only: [:index, :show, :new, :create, :edit, :update]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
