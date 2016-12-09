Rails.application.routes.draw do
  get 'notices/index'

  get 'welcome/index'

  root 'welcome#index'

  resources :notices

end
