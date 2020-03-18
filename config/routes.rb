# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  resources :products

  root 'home#welcome'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
