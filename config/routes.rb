Rails.application.routes.draw do
  resources :subjects
  resources :diretorios do
    member do
      delete :delete_diretorio
    end
  end
  get 'meusDiretorios', to:'diretorios#userDirectories'
  get 'menu', to: 'welcome#index'
  get 'signup', to: 'registrations#new'
  get 'login', to: 'registrations#login'
  get 'campi', to: 'campi#index'
  post 'login', to: 'registrations#makeLogin'
  post 'signup', to: 'registrations#create'
  delete 'logout', to: 'sessions#destroy'
  resources :registrations


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :buscar_diretorio
  get 'buscar', to: 'buscar#new'
  post 'buscar', to: 'buscar#show'
  # Defines the root path route ("/")
  # root "articles#index"
  root 'welcome#index'

  resources :about_page
  get 'about', to: 'about#index'
  post 'about', to: 'about#index'

  resources :upload_files
end
