Rails.application.routes.draw do
  resources :articles do
    resources :comments
  end

  get 'articles/index'
  get 'myarticles', to: 'articles#myarticles'

  devise_for :users
  root to: "home#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
