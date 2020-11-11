Rails.application.routes.draw do

  # mount ActionCable.server => '/cable'
  get '/rooms/new_join', to: 'rooms#new_join'
  post '/rooms/create_join', to: 'rooms#create_join'
  resources :rooms


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
  resources :users

  # You can have the root of your site routed with "root"
  # root 'welcome#index'
  match '/login', to: 'user_sessions#new', via: :get
  match '/login', to: 'user_sessions#create', via: :post
  match '/logout', to: 'user_sessions#destroy', via: :post
  match '/dashboard', to: 'user_sessions#index', via: :get
  # get  'auth/:provider/callback' => 'user_sessions#create'
  # get  'auth/failure' => 'user_sessions#failure'

  root to: redirect('/dashboard')

  #root "piles#pile_homepage"
  get "piles/pile_homepage"
  resources :piles
  match '/create_pile', to: 'piles#new', via: :get
  post 'piles/show'
  post 'piles/transfer_card'
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
