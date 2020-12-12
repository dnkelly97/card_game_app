Rails.application.routes.draw do
  get '/rooms/show_piles', to: 'rooms#show_piles'

  # mount ActionCable.server => '/cable'
  get '/rooms/new_join', to: 'rooms#new_join'
  post '/rooms/create_join', to: 'rooms#create_join'

  post 'rooms/show_hand', to: 'rooms#show_hand'
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

  resources :piles do
    collection do
      get 'get_from_draw'
      get 'discard'
      get 'show_transfer'
      post 'draw_cards_from_deck'
      post 'transfer_card'
      post 'transfer_to_discard'
    end
  end
  match '/create_pile', to: 'piles#new', via: :post
  match '/create_deck', to: 'piles#create_deck', via: :post
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
