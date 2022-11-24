Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :users, :path => 'terminal' do
    resources :backgrounds
    resources :projects, only: [:new, :create, :edit, :update, :index, :destroy]
    resources :videos
  end
  resources :projects, :path => 'watch', only: [:show]
end
