Rails.application.routes.draw do

  root :to => 'default#index'

  resources :surveys
  resources :pages
  resources :questions
  resources :responses

end
