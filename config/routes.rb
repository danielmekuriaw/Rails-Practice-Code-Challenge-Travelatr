Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :bloggers
  resources :posts
  resources :destinations
  post '/addlike/:id', to: 'posts#like', as: 'addlike'

end
