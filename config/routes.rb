Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users, # ここの行にカンマを追加
    controllers: { registrations: 'registrations' }
  
  resources :users, only: %i(show) do
  end


  resources :posts, only: %i(new create show edit delete) do
    resources :photos, only: %i(create)
  end
end
