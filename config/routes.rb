Rails.application.routes.draw do

  root :to => redirect('admin')

  resources :surveys
  resources :pages
  resources :questions
  resources :responses

  get 'admin/surveys',
    to: 'admin#surveys'

  get 'admin',
    to: 'admin#index'

  get 'client',
    to: 'client#index'

end
