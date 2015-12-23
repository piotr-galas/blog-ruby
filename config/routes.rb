Rails.application.routes.draw do
  resources :articles do
    resources :comments
  end
  resources :tags
  resources :authors
  resources :author_sessions, only: [ :new, :create, :destroy ]
  get 'login'  => 'author_sessions#new'
  get 'logout' => 'author_sessions#destroy'
  get 'stats'  => 'stats#index'
  root to: 'articles#index'
end
