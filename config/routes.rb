Rails.application.routes.draw do

  root  'demo#index'

  #authentication actions
  get  'admin', :to => 'access#menu'
  get  'access/menu'
  get  'access/login'
  post 'access/attempt_login'
  get  'access/logout'


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
  get   'demo/escape_output'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
