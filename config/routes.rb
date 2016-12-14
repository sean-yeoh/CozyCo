Rails.application.routes.draw do
  
  get 'payments/index'
  post 'payments/decision'

  get 'listings/index'

  get 'events/index'

  get 'notices/index'

  get 'welcome/index'

  root 'welcome#index'

  resources :notices


  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end





    resources :topics do
        resources :comments
     end


end
