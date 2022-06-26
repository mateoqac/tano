# frozen_string_literal: true

Rails.application.routes.draw do
  root 'home#index'

  post '/question/:id/yes', to: 'home#answer_yes', as: 'answer_yes'
  post '/question/:id/no', to: 'home#answer_no', as: 'answer_no'
  get '/reset_form', to: 'home#reset_form'

  get '/start_checking', to: 'home#start_checking'
end
