Rails.application.routes.draw do
  root 'posts#index'
  devise_for :users, :controllers => { registrations: 'registrations' }
  
  resources :users, only: [:show]
  
  resources :posts do
    resources :comments
  end
 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
