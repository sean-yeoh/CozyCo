Rails.application.routes.draw do
  get 'payments/index'

  get 'listings/index'

  get 'events/index'

  get 'notices/index'

  get 'welcome/index'

  root 'welcome#index'

  resources :notices

end
