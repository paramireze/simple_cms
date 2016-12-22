Rails.application.routes.draw do
  get 'pages/index'

  get 'pages/show'

  get 'pages/new'

  get 'pages/edit'

  get 'pages/delete'

  root  'demo#index'

  #gives all 8 actions on subject
  resources :subjects do
    member do
      get :delete
    end
  end

  #gives all 8 actions on sections
  resources :sections do
    member do
      get :delete
    end
  end

  #gives all 8 actions on pages
  resources :pages do
    member do
      get :delete
    end
  end


  get   'demo/index'
  get   'demo/hello'
  get   'demo/other_hello'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
