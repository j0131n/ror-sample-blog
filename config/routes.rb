Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :posts do
    resources :comments
  end

  # comment this one for now
  # resources :posts, except: :show
  # get 'posts/:slug' => 'posts#show'

  root 'posts#index', as: 'home'
end
