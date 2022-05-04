Rails.application.routes.draw do
  get 'tasks/index'
  devise_for :users
  root to: "tasks#index"
  resources :tasks
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end