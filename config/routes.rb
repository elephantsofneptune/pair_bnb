Rails.application.routes.draw do
  get 'payments/new'

    resources :listings
    resources :reservations
    resources :users
    resources :payments, only: [:new, :create]


    root 'home#index' 
    

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  #root 'home/reservations'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  #OmniAuth

  get "/auth/:provider/callback" => "sessions#create_from_omniauth"

  get '/login' , :to => 'sessions#new', :as => :login

  get '/listings', :to => 'listings#index'

  get '/reservations/:id(.:format)', :to => 'reservations#show'

      resources :listings do
       resources :reservations
    end 

    resources :users do
      resources :reservations
    end 

        resources :reservations, only: [:create, :destroy]

  # Example resource route with options:
  #   resources :products destroy
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
