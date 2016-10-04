Rails.application.routes.draw do
  resources :line_items
  resources :carts
  get 'store/index'

  resources :products
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  # define the root URL of entire website, as => the route user will see in the browser
  root 'store#index', as: 'store'
end
