Rails.application.routes.draw do

  get '/reservations/:id/payments/payment_method' => "payments#payment_method"
  post '/reservations/:id/payments/decision' => "payments#decision"
  get '/users/:id/payments/deposit' => "payments#deposit", as: :deposit
  post '/users/:id/payments/new' => "payments#new", as: :payment
  post '/users/:id/payments/create' => "payments#create"

  root 'welcome#index'

  resources :listings do
    resources :reservations
  end

  resources :notices

  resources :events

  resources :users, only: [:show, :edit, :update, :index]

  get '/search' => 'listings#search'

  post 'events/:id/attend' => 'event_attendees#attend', as: 'attend'
  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # mailbox folder routes
  get "mailbox/inbox" => "mailbox#inbox", as: :mailbox_inbox
  get "mailbox/sent" => "mailbox#sent", as: :mailbox_sent
  get "mailbox/trash" => "mailbox#trash", as: :mailbox_trash

  # conversations
  resources :conversations do
    member do
      post :reply
      post :trash
      post :untrash
    end
  end

  get "/users/:id/conversations/new" => 'conversations#new_private_message', as: 'new_private_message'
  # post "/users/:id/conversations" => 'conversations#create_private_message', as: 'private_message'

  resources :topics do
    resources :comments
  end
end
