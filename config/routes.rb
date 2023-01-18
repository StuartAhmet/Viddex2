Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  root to: "pages#home"
  get 'contactus', to: 'pages#contactus'
  post '/contactus', to: 'contacts#create'
  get 'contacts/new' => 'contacts#new'
  resources :users, :path => 'terminal' do
    resources :backgrounds
    resources :projects, only: [:new, :create, :edit, :update, :index, :destroy]
    resources :videos
    resources :audios, :path => 'audio-files'
  end
  resources :projects, :path => 'watch', only: [:show]
  resources :contacts do
    collection do
      post :new
    end
  end
end
