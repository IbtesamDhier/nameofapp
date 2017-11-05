Rails.application.routes.draw do

  resources :products

  resources :orders, only: [:index, :show, :create, :destroy]

 
  # root
  root 'static_pages#index'


  # static_pages routes
  get 'static_pages/', to: 'static_pages#index' 

  get 'static_pages/index'

  get 'static_pages/about'

  get 'static_pages/contact', to: 'static_pages#contact'

  get 'static_pages/landing_page'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
