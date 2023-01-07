Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  root to: "pages#home"
  get "contact", to: "pages#contact"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :users, :path => 'terminal' do
    resources :backgrounds
    resources :projects, only: [:new, :create, :edit, :update, :index, :destroy]
    resources :videos
    resources :audios, :path => 'audio-files'
  end
  resources :projects, :path => 'watch', only: [:show]
end
