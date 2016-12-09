Rails.application.routes.draw do
  get 'payments/index'

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




  resources :forums do
    resources :topics do
      resources :posts do
        resources :comments
      end
    end
  end

end
