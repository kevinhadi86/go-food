Rails.application.routes.draw do
  resources :carts
  get 'store/index', as: 'store_index'
  resources :foods
  get 'home/hello'
  resources :line_items
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
