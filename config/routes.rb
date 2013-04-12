Gemstone::Application.routes.draw do
  match 'auth/:provider/callback', to: 'sessions#create'
  match 'auth/failure', to: redirect('/')
  match 'signout', to: 'sessions#destroy', as: 'signout'
  get 'pictures/add/:link' => 'pictures#create', as: :add_picture
  match 'comments/mine' => 'comments#mine', as: :my_comments

  resources :users
  resources :pictures
  resources :comments
  resources :ratings

  match 'pictures/:id/retrieve' => 'pictures#retrieve', :as => :retrieve
  
  root to: 'users#index'

end
