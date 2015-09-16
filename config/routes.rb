Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :customers, only: [:index, :show]
      get "customers/find", to: "customers#find"
      get "customers/find_all", to: "customers#find_all"
      get "customers/random", to: "customers#random"

      resources :merchants, only: [:index, :show]
      get "merchants/find", to: "merchants#find"
      get "merchants/find_all", to: "merchants#find_all"
      get "merchants/random", to: "merchants#random"
      get "merchants/:id/items", to: "merchants#items"
      get "merchants/:id/invoices", to: "merchants#invoices"

      resources :items, only: [:index, :show]
      get "items/find", to: "items#find"
      get "items/find_all", to: "items#find_all"
      get "items/random", to: "items#random"

      resources :invoices, only: [:index, :show]
      get "invoices/find", to: "invoices#find"
      get "invoices/find_all", to: "invoices#find_all"
      get "invoices/random", to: "invoices#random"

      resources :invoice_items, only: [:index, :show]
      get "invoice_items/find", to: "invoice_items#find"
      get "invoice_items/find_all", to: "invoice_items#find_all"
      get "invoice_items/random", to: "invoice_items#random"
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







