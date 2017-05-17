Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root :to => "home#index"
  resources :income
  resources :expenses
  resources :budget_setup
  resources :categories
  resources :subcategories
  resources :monthly_budget
  resources :details
end
