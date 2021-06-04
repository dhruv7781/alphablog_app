Rails.application.routes.draw do
  
 root 'pages#home'

 get 'about', to: 'pages#about'
 resources :article
 post '/article/new' => 'article#create'

 get 'signup', to: 'users#new'
resources :users, except: [:new]
end
