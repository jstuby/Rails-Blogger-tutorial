Blogger::Application.routes.draw do
resources :authors
  resources :author_sessions

  root :to => 'articles#index'
  resources :articles
  resources :comments
  resources :tags

  match 'login' => 'author_sessions#new', :as => :login
  match 'logout' => 'author_sessions#destroy', :as => :logout
end
