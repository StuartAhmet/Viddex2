Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  root to: "pages#home"
  get 'contactus', to: 'pages#contactus'    # to get to 'contact us' page
  get 'myadmin', to: 'admin#admin'
  get 'pricing', to: 'pages#pricing'        # to get to 'pricing' page
  get 'who_we_are', to: 'pages#who_we_are'  # to get to 'who we are' page
  get 'what_we_do', to: 'pages#what_we_do'  # to get to 'what we do' page
  post '/contactus', to: 'contacts#create'
  get 'contacts/new' => 'contacts#new'
  get '/contacts/:id', to: 'contacts#show'
  patch '/contacts/:id', to: 'contacts#update'

  resources :users, :path => 'terminal' do
    resources :backgrounds, :path => 'images'
    resources :projects, only: [:new, :create, :edit, :update, :index, :destroy] do
      get :preview, on: :member
    end
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
