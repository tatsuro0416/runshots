Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users
  
  resources :posts, only: %i(new create) do
    resources :photos, only: %i(create)
  end
end
