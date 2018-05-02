Rails.application.routes.draw do
  get 'users/index'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
  
  root 'staticpages#index'
  
  get '/pages' => 'pages#index'
  get '/next-event-is-still-planned' => 'staticpages#next_event_is_still_planned'
  get '/ninjas-works' => 'staticpages#ninjas_works'
  
  get '/auth/:provider/callback' => 'admin/users#callback'
  
  namespace :admin do
    resources :posts # => /admin/posts etc...
    get 'sessions/index'
    get 'sessions/new'
    get 'sessions/login'
  end
  
  scope module: :public do
    resources :posts, only: [:show,:index] # => /posts etc...
  end
  
  resources :pages, only: [:show], :path => '/'
  
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
