# frozen_string_literal: true

Rails.application.routes.draw do
  root 'home#index'

  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"
  get "login", to: "sessions#new"
  
  post 'sign_up', to: 'login_users#create'
  get 'sign_up', to: 'login_users#new'
  resources :login_user_confirmations, only: [:create, :new, :edit], param: :confirmation_token

  post '/question/:id/yes', to: 'home#answer_yes', as: 'answer_yes'
  post '/question/:id/no', to: 'home#answer_no', as: 'answer_no'
  get '/reset_form', to: 'home#reset_form'

  get '/start_checking', to: 'home#start_checking'
end
