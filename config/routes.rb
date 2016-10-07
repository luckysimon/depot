Rails.application.routes.draw do
  resources :orders
  resources :line_items
  resources :carts
  get 'store/index'

  resources :products do
    # products/id/who_bought.atom 
    get :who_bought, on: :member
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  # define the root URL of entire website, as => the route user will see in the browser
  root 'store#index', as: 'store'
end
