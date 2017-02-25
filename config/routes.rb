Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'
  get 'post/:id' => 'post#show'
  get 'login/github' => 'user#login'
  get 'login/github/callback' => 'user#login_callback'
  get 'logout' => 'session#destroy'
end
