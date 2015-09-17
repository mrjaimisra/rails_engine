Rails.application.routes.draw do

  get "/api/v1/customers/find", to: "api/v1/customers#find"
  get "/api/v1/customers/find_all", to: "api/v1/customers#find_all"
  get "/api/v1/customers/random", to: "api/v1/customers#random"

  get "/api/v1/merchants/find", to: "api/v1/merchants#find"
  get "/api/v1/merchants/find_all", to: "api/v1/merchants#find_all"
  get "/api/v1/merchants/random", to: "api/v1/merchants#random"

  get "/api/v1/items/find", to: "api/v1/items#find"
  get "/api/v1/items/find_all", to: "api/v1/items#find_all"
  get "/api/v1/items/random", to: "api/v1/items#random"

  get "/api/v1/invoices/find", to: "api/v1/invoices#find"
  get "/api/v1/invoices/find_all", to: "api/v1/invoices#find_all"
  get "/api/v1/invoices/random", to: "api/v1/invoices#random"

  get "/api/v1/invoice_items/find", to: "api/v1/invoice_items#find"
  get "/api/v1/invoice_items/find_all", to: "api/v1/invoice_items#find_all"
  get "/api/v1/invoice_items/random", to: "api/v1/invoice_items#random"

  get "/api/v1/transactions/find", to: "api/v1/transactions#find"
  get "/api/v1/transactions/find_all", to: "api/v1/transactions#find_all"
  get "/api/v1/transactions/random", to: "api/v1/transactions#random"

  namespace :api do
    namespace :v1 do
      resources :merchants, only: [:index, :show]
      get "merchants/:id/items", to: "merchants#items"
      get "merchants/:id/invoices", to: "merchants#invoices"

      resources :customers, only: [:index, :show]


      resources :items, only: [:index, :show]
      get "items/:id/invoice_items", to: "items#invoice_items"
      get "items/:id/merchant", to: "items#merchant"

      resources :invoices, only: [:index, :show]
      get "invoices/:id/transactions", to: "invoices#transactions"
      get "invoices/:id/invoice_items", to: "invoices#invoice_items"
      get "invoices/:id/items", to: "invoices#items"
      get "invoices/:id/customer", to: "invoices#customer"
      get "invoices/:id/merchant", to: "invoices#merchant"

      resources :invoice_items, only: [:index, :show]
      get "invoice_items/:id/invoice", to: "invoice_items#invoice"
      get "invoice_items/:id/item", to: "invoice_items#item"

      resources :transactions, only: [:index, :show]

    end
  end
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end







