Rails.application.routes.draw do
  namespace :admin do
    resources :items
resources :sites
resources :users
resources :user_sites

    root to: "items#index"
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'
  get 'item/:id' => 'item#show'
  get 'login/github' => 'user#login'
  get 'login/github/callback' => 'user#login_callback'
  get 'logout' => 'session#destroy'
  post '/site/create', to: 'site#create'
  get '/site', to: 'site#index'
  get '/items/add' => 'welcome#add'
  get '/site/:id' => 'site#show'
  get '/site/sub/:id' => 'site#sub'
  get '/site/del_sub/:id' => 'site#del_sub'
end
